@interface ASTVirtualTrackpadInnerColorController
- (id)trackpadInnerColor;
- (id)trackpadOpacity;
- (void)setTrackpadInnerColor:(id)a3;
- (void)setTrackpadOpacity:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation ASTVirtualTrackpadInnerColorController

- (id)trackpadOpacity
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchVirtualTrackpadInnerOpacity];
  *(float *)&double v3 = v3;
  v4 = +[NSNumber numberWithFloat:v3];

  return v4;
}

- (void)setTrackpadOpacity:(id)a3
{
  id v3 = a3;
  id v6 = +[AXSettings sharedInstance];
  [v3 floatValue];
  float v5 = v4;

  [v6 setAssistiveTouchVirtualTrackpadInnerOpacity:v5];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  v8 = [(ASTVirtualTrackpadInnerColorController *)self specifierForIndexPath:a5];
  v9 = [v8 propertyForKey:@"ColorKey"];
  if (v9)
  {
    id v10 = v7;
    unsigned int v11 = [v9 intValue];
    unsigned int v12 = [v9 intValue];
    v13 = [(ASTVirtualTrackpadInnerColorController *)self trackpadInnerColor];
    objc_msgSend(v10, "setChecked:", v12 == objc_msgSend(v13, "intValue"));

    int v14 = _ASTVirtualTrackpadColorValues();
    v15 = [(ASTVirtualTrackpadInnerColorController *)self traitCollection];
    v16 = (char *)[v15 userInterfaceStyle];

    if (v14) {
      BOOL v17 = v11 == 1;
    }
    else {
      BOOL v17 = 1;
    }
    unsigned int v18 = !v17;
    if (v16 == (unsigned char *)&dword_0 + 2) {
      uint64_t v19 = v14 != 0;
    }
    else {
      uint64_t v19 = v18;
    }
    [v10 setFillCircle:v19];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)ASTVirtualTrackpadInnerColorController;
  [(ASTVirtualTrackpadInnerColorController *)&v30 tableView:v6 didSelectRowAtIndexPath:v7];
  v8 = [(ASTVirtualTrackpadInnerColorController *)self specifierForIndexPath:v7];
  v9 = [v8 propertyForKey:@"ColorKey"];
  if (v9)
  {
    v22 = v8;
    id v23 = v7;
    id v10 = self;
    v21 = v9;
    [(ASTVirtualTrackpadInnerColorController *)self setTrackpadInnerColor:v9];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v24 = v6;
    id obj = [v6 visibleCells];
    id v11 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v16 = [v15 specifier];
          BOOL v17 = [v16 propertyForKey:@"ColorKey"];
          unsigned int v18 = v17;
          if (v17)
          {
            unsigned int v19 = [v17 intValue];
            v20 = [(ASTVirtualTrackpadInnerColorController *)v10 trackpadInnerColor];
            objc_msgSend(v15, "setChecked:", v19 == objc_msgSend(v20, "intValue"));
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v12);
    }

    id v7 = v23;
    id v6 = v24;
    v9 = v21;
    v8 = v22;
  }
}

- (id)trackpadInnerColor
{
  v2 = +[AXSettings sharedInstance];
  id v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 assistiveTouchVirtualTrackpadInnerColor]);

  return v3;
}

- (void)setTrackpadInnerColor:(id)a3
{
  id v3 = a3;
  id v5 = +[AXSettings sharedInstance];
  id v4 = [v3 integerValue];

  [v5 setAssistiveTouchVirtualTrackpadInnerColor:v4];
}

@end