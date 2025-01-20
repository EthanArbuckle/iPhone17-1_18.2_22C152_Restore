@interface VOTBrailleTerminalManager
+ (id)sharedManager;
- (BOOL)handleDelete;
- (BOOL)handleEscape;
- (BOOL)handleForwardDelete;
- (BOOL)handleLeftArrow;
- (BOOL)handleReturn;
- (BOOL)handleRightArrow;
- (NSString)commandLine;
- (VOTBrailleTerminalManager)init;
- (VOTBrailleTerminalOutputProtocol)outputManager;
- (id)nameSearcherEntriesPassingSearchFrom:(id)a3;
- (int64_t)cursor;
- (unint64_t)_currentContext;
- (unint64_t)state;
- (void)_executeCommand;
- (void)_refresh;
- (void)commandInsertString:(id)a3;
- (void)handleFirstElement;
- (void)handleLastElement;
- (void)replaceCommandRange:(_NSRange)a3 withString:(id)a4 cursor:(int64_t)a5;
- (void)setCommandLine:(id)a3;
- (void)setCursor:(int64_t)a3;
- (void)setOutputManager:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)turnOff;
@end

@implementation VOTBrailleTerminalManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A084;
  block[3] = &unk_1001B3580;
  block[4] = a1;
  if (qword_1001EBD18 != -1) {
    dispatch_once(&qword_1001EBD18, block);
  }
  v2 = (void *)qword_1001EBD20;

  return v2;
}

- (VOTBrailleTerminalManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VOTBrailleTerminalManager;
  v2 = [(VOTBrailleTerminalManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    [(VOTBrailleTerminalManager *)v2 setCommandLine:&stru_1001B7888];
    [(VOTBrailleTerminalManager *)v3 setCursor:0];
    [(VOTBrailleTerminalManager *)v3 setOutputManager:0];
    v4 = v3;
  }

  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  unint64_t state = self->_state;
  if (state != a3)
  {
    if (a3 != 2)
    {
      objc_super v6 = [(VOTBrailleTerminalManager *)self outputManager];
      [v6 deactivate];

      [(VOTBrailleTerminalManager *)self setOutputManager:0];
      unint64_t state = self->_state;
    }
    if (!state)
    {
      [(VOTBrailleTerminalManager *)self setCommandLine:&stru_1001B7888];
      [(VOTBrailleTerminalManager *)self setCursor:0];
    }
    self->_unint64_t state = a3;
    [(VOTBrailleTerminalManager *)self _refresh];
  }
}

- (void)turnOff
{
}

- (unint64_t)_currentContext
{
  v2 = +[VOTWorkspace sharedWorkspace];
  v3 = [v2 currentElement];

  v4 = [v3 application];
  if ([v4 isSpringBoard])
  {
    char v5 = 0;
  }
  else
  {
    objc_super v6 = [v3 immediateRemoteParent];
    v7 = [v6 application];
    unsigned __int8 v8 = [v7 isSpringBoard];

    char v5 = v8 ^ 1;
  }

  v9 = +[AXSpringBoardServer server];
  unsigned int v10 = [v9 isScreenLockedWithPasscode:0];

  if ((v5 & 1) != 0 || (unint64_t v11 = 0, v10))
  {
    if ([v3 isInAppSwitcher]) {
      unint64_t v11 = 1;
    }
    else {
      unint64_t v11 = 2;
    }
  }

  return v11;
}

- (BOOL)handleReturn
{
  unint64_t v3 = [(VOTBrailleTerminalManager *)self state];
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = [(VOTBrailleTerminalManager *)self outputManager];
      -[VOTBrailleTerminalManager setState:](self, "setState:", [v4 selectCurrentOutput]);
    }
    else if (v3 == 1)
    {
      [(VOTBrailleTerminalManager *)self _executeCommand];
    }
    return 1;
  }
  else
  {
    v7 = +[VOTBrailleManager manager];
    unsigned int v8 = [v7 hasActiveBrailleDisplay];

    if (v8)
    {
      BOOL v5 = 1;
      [(VOTBrailleTerminalManager *)self setState:1];
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (BOOL)handleLeftArrow
{
  unint64_t v3 = [(VOTBrailleTerminalManager *)self state];
  if (v3 == 2)
  {
    v4 = [(VOTBrailleTerminalManager *)self outputManager];
    [v4 moveToPreviousOutput];

    return 1;
  }
  if (v3 == 1)
  {
    if ([(VOTBrailleTerminalManager *)self cursor] >= 1) {
      -[VOTBrailleTerminalManager replaceCommandRange:withString:cursor:](self, "replaceCommandRange:withString:cursor:", 0, 0, &stru_1001B7888, (char *)[(VOTBrailleTerminalManager *)self cursor] - 1);
    }
    return 1;
  }
  return 0;
}

- (BOOL)handleRightArrow
{
  unint64_t v3 = [(VOTBrailleTerminalManager *)self state];
  if (v3 == 2)
  {
    v7 = [(VOTBrailleTerminalManager *)self outputManager];
    [v7 moveToNextOutput];

    return 1;
  }
  if (v3 == 1)
  {
    unint64_t v4 = [(VOTBrailleTerminalManager *)self cursor];
    BOOL v5 = [(VOTBrailleTerminalManager *)self commandLine];
    id v6 = [v5 length];

    if (v4 < (unint64_t)v6) {
      -[VOTBrailleTerminalManager replaceCommandRange:withString:cursor:](self, "replaceCommandRange:withString:cursor:", 0, 0, &stru_1001B7888, (char *)[(VOTBrailleTerminalManager *)self cursor] + 1);
    }
    return 1;
  }
  return 0;
}

- (BOOL)handleDelete
{
  unint64_t v3 = [(VOTBrailleTerminalManager *)self state];
  if (v3 == 2)
  {
    return [(VOTBrailleTerminalManager *)self handleEscape];
  }
  else
  {
    if (v3 != 1) {
      return 0;
    }
    BOOL v4 = 1;
    if ([(VOTBrailleTerminalManager *)self cursor] >= 1) {
      -[VOTBrailleTerminalManager replaceCommandRange:withString:cursor:](self, "replaceCommandRange:withString:cursor:", (char *)[(VOTBrailleTerminalManager *)self cursor] - 1, 1, &stru_1001B7888, (char *)[(VOTBrailleTerminalManager *)self cursor] - 1);
    }
    return v4;
  }
}

- (BOOL)handleForwardDelete
{
  unint64_t v3 = [(VOTBrailleTerminalManager *)self state];
  if (v3 == 2)
  {
    return [(VOTBrailleTerminalManager *)self handleEscape];
  }
  else
  {
    if (v3 != 1) {
      return 0;
    }
    unint64_t v4 = [(VOTBrailleTerminalManager *)self cursor];
    BOOL v5 = [(VOTBrailleTerminalManager *)self commandLine];
    id v6 = [v5 length];

    if (v4 >= (unint64_t)v6) {
      return 1;
    }
    BOOL v7 = 1;
    -[VOTBrailleTerminalManager replaceCommandRange:withString:cursor:](self, "replaceCommandRange:withString:cursor:", [(VOTBrailleTerminalManager *)self cursor], 1, &stru_1001B7888, [(VOTBrailleTerminalManager *)self cursor]);
    return v7;
  }
}

- (BOOL)handleEscape
{
  unint64_t v3 = [(VOTBrailleTerminalManager *)self state];
  if (v3 == 1)
  {
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    uint64_t v4 = 1;
LABEL_5:
    [(VOTBrailleTerminalManager *)self setState:v4];
    return 1;
  }
  return 0;
}

- (void)_refresh
{
  unint64_t v3 = [(VOTBrailleTerminalManager *)self state];
  if (v3 == 1)
  {
    id v5 = +[VOTBrailleManager manager];
    uint64_t v4 = [(VOTBrailleTerminalManager *)self commandLine];
    objc_msgSend(v5, "refreshBrailleForTerminalCommand:cursor:", v4, -[VOTBrailleTerminalManager cursor](self, "cursor"));
  }
  else
  {
    if (v3) {
      return;
    }
    id v5 = +[VOTBrailleManager manager];
    [v5 refreshBrailleForTerminalOff];
  }
}

- (void)replaceCommandRange:(_NSRange)a3 withString:(id)a4 cursor:(int64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a4;
  if ((id)[(VOTBrailleTerminalManager *)self state] == (id)1)
  {
    v9 = [(VOTBrailleTerminalManager *)self commandLine];
    unsigned int v10 = objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", location, length, v11);
    [(VOTBrailleTerminalManager *)self setCommandLine:v10];

    [(VOTBrailleTerminalManager *)self setCursor:a5];
    [(VOTBrailleTerminalManager *)self _refresh];
  }
}

- (void)commandInsertString:(id)a3
{
  id v4 = a3;
  -[VOTBrailleTerminalManager replaceCommandRange:withString:cursor:](self, "replaceCommandRange:withString:cursor:", -[VOTBrailleTerminalManager cursor](self, "cursor"), 0, v4, (char *)-[VOTBrailleTerminalManager cursor](self, "cursor") + (void)[v4 length]);
}

- (void)_executeCommand
{
  if ((id)[(VOTBrailleTerminalManager *)self state] == (id)1)
  {
    unint64_t v3 = [(VOTBrailleTerminalManager *)self _currentContext];
    if (v3 >= 2)
    {
      if (v3 != 2) {
        return;
      }
      v9 = [(id)VOTSharedWorkspace currentElement];
      id v6 = [[VOTNameSearcherElementSource alloc] initWithElement:v9];
      BOOL v7 = [[VOTBrailleTerminalNameSearchOutputManager alloc] initWithItemSource:v6 filter:self];
      [(VOTBrailleTerminalManager *)self setOutputManager:v7];

      unsigned int v8 = [(VOTBrailleTerminalManager *)self outputManager];
      [v8 activate];

      [(VOTBrailleTerminalManager *)self setState:2];
    }
    else
    {
      v9 = [[VOTNameSearcherAppSource alloc] initWithLaunchContext:v3 != 0];
      id v4 = [[VOTBrailleTerminalNameSearchOutputManager alloc] initWithItemSource:v9 filter:self];
      [(VOTBrailleTerminalManager *)self setOutputManager:v4];

      id v5 = [(VOTBrailleTerminalManager *)self outputManager];
      [v5 activate];

      [(VOTBrailleTerminalManager *)self setState:2];
    }
  }
}

- (void)handleFirstElement
{
  if ((id)[(VOTBrailleTerminalManager *)self state] == (id)2)
  {
    id v3 = [(VOTBrailleTerminalManager *)self outputManager];
    [v3 moveToFirstOutput];
  }
}

- (void)handleLastElement
{
  if ((id)[(VOTBrailleTerminalManager *)self state] == (id)2)
  {
    id v3 = [(VOTBrailleTerminalManager *)self outputManager];
    [v3 moveToLastOutput];
  }
}

- (id)nameSearcherEntriesPassingSearchFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTBrailleTerminalManager *)self commandLine];
  id v6 = [v5 length];

  if (v6)
  {
    v26 = objc_opt_new();
    id v23 = v4;
    v24 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v4;
    id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "name", v23);
          v13 = [v12 lowercaseString];
          v14 = [(VOTBrailleTerminalManager *)self commandLine];
          v15 = [v14 lowercaseString];
          unsigned __int8 v16 = [v13 hasPrefix:v15];

          v17 = v26;
          if (v16) {
            goto LABEL_9;
          }
          v18 = [v11 name];
          v19 = [(VOTBrailleTerminalManager *)self commandLine];
          unsigned int v20 = [v18 localizedCaseInsensitiveContainsString:v19];

          v17 = v24;
          if (v20) {
LABEL_9:
          }
            [v17 addObject:v11];
        }
        id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v8);
    }

    id v21 = [v26 arrayByAddingObjectsFromArray:v24];

    id v4 = v23;
  }
  else
  {
    id v21 = v4;
  }

  return v21;
}

- (NSString)commandLine
{
  return self->_commandLine;
}

- (void)setCommandLine:(id)a3
{
}

- (int64_t)cursor
{
  return self->_cursor;
}

- (void)setCursor:(int64_t)a3
{
  self->_cursor = a3;
}

- (VOTBrailleTerminalOutputProtocol)outputManager
{
  return self->_outputManager;
}

- (void)setOutputManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputManager, 0);

  objc_storeStrong((id *)&self->_commandLine, 0);
}

@end