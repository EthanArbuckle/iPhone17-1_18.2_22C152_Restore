@interface PSSpecifier
+ (void)updateSpecifiers:(id)a3 withTarget:(id)a4;
- (BOOL)byod_startSpinner;
- (BOOL)byod_stopSpinner;
@end

@implementation PSSpecifier

+ (void)updateSpecifiers:(id)a3 withTarget:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "setTarget:", v6, (void)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)byod_startSpinner
{
  v2 = [(PSSpecifier *)self propertyForKey:PSTableCellKey];
  if (v2)
  {
    id v3 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v3 startAnimating];
    if ([v2 isEditing]) {
      [v2 setEditingAccessoryView:v3];
    }
    else {
      [v2 setAccessoryView:v3];
    }
  }
  return v2 != 0;
}

- (BOOL)byod_stopSpinner
{
  id v3 = [(PSSpecifier *)self propertyForKey:PSTableCellKey];
  v4 = v3;
  if (v3)
  {
    if ([v3 isEditing])
    {
      id v5 = [(PSSpecifier *)self propertyForKey:PSControlKey];
      [v4 setEditingAccessoryView:v5];
    }
    else
    {
      id v5 = [(PSSpecifier *)self propertyForKey:PSControlKey];
      [v4 setAccessoryView:v5];
    }
  }
  return v4 != 0;
}

@end