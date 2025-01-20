@interface SRCompactViewControllerContentTesterState
- (BOOL)compactViewHasContent;
- (BOOL)contextMenuIsPresented;
- (BOOL)deviceIsPad;
- (BOOL)editableUtteranceViewHasContent;
- (BOOL)keyboardHasContent;
- (BOOL)multiLevelViewHasContent;
- (BOOL)navigationBarHasContent;
- (BOOL)navigationStackIsPopping;
- (BOOL)siriViewControllerIsEditing;
- (SRCompactViewControllerContentTesterState)initWithDeviceIsPad:(BOOL)a3 navigationStackIsPopping:(BOOL)a4 navigationStackSize:(int64_t)a5 navigationBarHasContent:(BOOL)a6 multiLevelViewHasContent:(BOOL)a7 editableUtteranceViewHasContent:(BOOL)a8 compactViewHasContent:(BOOL)a9 siriViewControllerIsEditing:(BOOL)a10 keyboardHasContent:(BOOL)a11 contextMenuIsPresented:(BOOL)a12;
- (id)_debugDescriptionForProperty:(id)a3 BOOLValue:(BOOL)a4;
- (id)_debugDescriptionForProperty:(id)a3 formattedValue:(id)a4;
- (id)_debugDescriptionForProperty:(id)a3 integerValue:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)navigationStackSize;
@end

@implementation SRCompactViewControllerContentTesterState

- (SRCompactViewControllerContentTesterState)initWithDeviceIsPad:(BOOL)a3 navigationStackIsPopping:(BOOL)a4 navigationStackSize:(int64_t)a5 navigationBarHasContent:(BOOL)a6 multiLevelViewHasContent:(BOOL)a7 editableUtteranceViewHasContent:(BOOL)a8 compactViewHasContent:(BOOL)a9 siriViewControllerIsEditing:(BOOL)a10 keyboardHasContent:(BOOL)a11 contextMenuIsPresented:(BOOL)a12
{
  v19.receiver = self;
  v19.super_class = (Class)SRCompactViewControllerContentTesterState;
  result = [(SRCompactViewControllerContentTesterState *)&v19 init];
  if (result)
  {
    result->_deviceIsPad = a3;
    result->_navigationStackIsPopping = a4;
    result->_navigationStackSize = a5;
    result->_navigationBarHasContent = a6;
    result->_multiLevelViewHasContent = a7;
    result->_editableUtteranceViewHasContent = a8;
    result->_compactViewHasContent = a9;
    result->_siriViewControllerIsEditing = a10;
    result->_keyboardHasContent = a11;
    result->_contextMenuIsPresented = a12;
  }
  return result;
}

- (id)_debugDescriptionForProperty:(id)a3 formattedValue:(id)a4
{
  return +[NSString stringWithFormat:@"%@=%@", a3, a4];
}

- (id)_debugDescriptionForProperty:(id)a3 BOOLValue:(BOOL)a4
{
  if (a4) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  return [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:a3 formattedValue:v4];
}

- (id)_debugDescriptionForProperty:(id)a3 integerValue:(int64_t)a4
{
  id v6 = a3;
  v7 = +[NSString stringWithFormat:@"%zd", a4];
  v8 = [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:v6 formattedValue:v7];

  return v8;
}

- (id)debugDescription
{
  v3 = +[NSMutableString stringWithString:@"<"];
  CFStringRef v4 = [(id)objc_opt_class() description];
  [v3 appendString:v4];

  v23 = [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:@"deviceIsPad" BOOLValue:[(SRCompactViewControllerContentTesterState *)self deviceIsPad]];
  v29[0] = v23;
  v22 = [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:@"navigationStackIsPopping" BOOLValue:[(SRCompactViewControllerContentTesterState *)self deviceIsPad]];
  v29[1] = v22;
  v5 = [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:@"navigationStackSize" integerValue:[(SRCompactViewControllerContentTesterState *)self navigationStackSize]];
  v29[2] = v5;
  id v6 = [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:@"navigationBarHasContent" BOOLValue:[(SRCompactViewControllerContentTesterState *)self navigationBarHasContent]];
  v29[3] = v6;
  v7 = [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:@"multiLevelViewHasContent" BOOLValue:[(SRCompactViewControllerContentTesterState *)self multiLevelViewHasContent]];
  v29[4] = v7;
  v8 = [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:@"editableUtteranceViewHasContent" BOOLValue:[(SRCompactViewControllerContentTesterState *)self editableUtteranceViewHasContent]];
  v29[5] = v8;
  v9 = [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:@"compactViewHasContent" BOOLValue:[(SRCompactViewControllerContentTesterState *)self compactViewHasContent]];
  v29[6] = v9;
  v10 = [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:@"siriViewControllerIsEditing" BOOLValue:[(SRCompactViewControllerContentTesterState *)self siriViewControllerIsEditing]];
  v29[7] = v10;
  v11 = [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:@"keyboardHasContent" BOOLValue:[(SRCompactViewControllerContentTesterState *)self keyboardHasContent]];
  v29[8] = v11;
  v12 = [(SRCompactViewControllerContentTesterState *)self _debugDescriptionForProperty:@"contextMenuIsPresented" BOOLValue:[(SRCompactViewControllerContentTesterState *)self contextMenuIsPresented]];
  v29[9] = v12;
  v13 = +[NSArray arrayWithObjects:v29 count:10];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        [v3 appendString:@"\n\t"];
        [v3 appendString:v19];
      }
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  [v3 appendString:@"\n>"];
  id v20 = [v3 mutableCopy];

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v15 = [SRCompactViewControllerContentTesterState alloc];
  BOOL v4 = [(SRCompactViewControllerContentTesterState *)self deviceIsPad];
  BOOL v5 = [(SRCompactViewControllerContentTesterState *)self navigationStackIsPopping];
  int64_t v6 = [(SRCompactViewControllerContentTesterState *)self navigationStackSize];
  BOOL v7 = [(SRCompactViewControllerContentTesterState *)self navigationBarHasContent];
  BOOL v8 = [(SRCompactViewControllerContentTesterState *)self multiLevelViewHasContent];
  BOOL v9 = [(SRCompactViewControllerContentTesterState *)self editableUtteranceViewHasContent];
  unsigned __int8 v10 = [(SRCompactViewControllerContentTesterState *)self compactViewHasContent];
  unsigned __int8 v11 = [(SRCompactViewControllerContentTesterState *)self siriViewControllerIsEditing];
  unsigned __int8 v12 = [(SRCompactViewControllerContentTesterState *)self keyboardHasContent];
  BYTE3(v14) = [(SRCompactViewControllerContentTesterState *)self contextMenuIsPresented];
  BYTE2(v14) = v12;
  BYTE1(v14) = v11;
  LOBYTE(v14) = v10;
  return -[SRCompactViewControllerContentTesterState initWithDeviceIsPad:navigationStackIsPopping:navigationStackSize:navigationBarHasContent:multiLevelViewHasContent:editableUtteranceViewHasContent:compactViewHasContent:siriViewControllerIsEditing:keyboardHasContent:contextMenuIsPresented:](v15, "initWithDeviceIsPad:navigationStackIsPopping:navigationStackSize:navigationBarHasContent:multiLevelViewHasContent:editableUtteranceViewHasContent:compactViewHasContent:siriViewControllerIsEditing:keyboardHasContent:contextMenuIsPresented:", v4, v5, v6, v7, v8, v9, v14);
}

- (BOOL)deviceIsPad
{
  return self->_deviceIsPad;
}

- (BOOL)navigationStackIsPopping
{
  return self->_navigationStackIsPopping;
}

- (int64_t)navigationStackSize
{
  return self->_navigationStackSize;
}

- (BOOL)navigationBarHasContent
{
  return self->_navigationBarHasContent;
}

- (BOOL)multiLevelViewHasContent
{
  return self->_multiLevelViewHasContent;
}

- (BOOL)editableUtteranceViewHasContent
{
  return self->_editableUtteranceViewHasContent;
}

- (BOOL)compactViewHasContent
{
  return self->_compactViewHasContent;
}

- (BOOL)siriViewControllerIsEditing
{
  return self->_siriViewControllerIsEditing;
}

- (BOOL)keyboardHasContent
{
  return self->_keyboardHasContent;
}

- (BOOL)contextMenuIsPresented
{
  return self->_contextMenuIsPresented;
}

@end