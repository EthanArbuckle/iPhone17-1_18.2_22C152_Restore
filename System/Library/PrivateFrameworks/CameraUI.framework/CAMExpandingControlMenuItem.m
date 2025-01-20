@interface CAMExpandingControlMenuItem
+ (id)_menuItemWithState:(id)a3 subtitle:(id)a4 selectedSubtitle:(id)a5 configuration:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItem:(id)a3;
- (CAMExpandingControlMenuItemConfiguration)_configuration;
- (NSString)selectedSubtitle;
- (NSString)subtitle;
- (NSValue)state;
@end

@implementation CAMExpandingControlMenuItem

+ (id)_menuItemWithState:(id)a3 subtitle:(id)a4 selectedSubtitle:(id)a5 configuration:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = objc_alloc_init((Class)objc_opt_class());
  v14 = (void *)*((void *)v13 + 1);
  *((void *)v13 + 1) = v9;
  id v15 = v9;

  v16 = (void *)*((void *)v13 + 2);
  *((void *)v13 + 2) = v10;
  id v17 = v10;

  if (v12) {
    v18 = v12;
  }
  else {
    v18 = v17;
  }
  objc_storeStrong((id *)v13 + 3, v18);
  uint64_t v19 = [v11 copy];

  v20 = (void *)*((void *)v13 + 4);
  *((void *)v13 + 4) = v19;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = [(CAMExpandingControlMenuItem *)self isEqualToItem:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToItem:(id)a3
{
  id v4 = (CAMExpandingControlMenuItem *)a3;
  BOOL v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      char v14 = 1;
    }
    else
    {
      v6 = [(CAMExpandingControlMenuItem *)self state];
      v7 = [(CAMExpandingControlMenuItem *)v5 state];
      if ([v6 isEqualToValue:v7])
      {
        v8 = [(CAMExpandingControlMenuItem *)self subtitle];
        id v9 = [(CAMExpandingControlMenuItem *)v5 subtitle];
        if ([v8 isEqualToString:v9])
        {
          id v10 = [(CAMExpandingControlMenuItem *)self selectedSubtitle];
          id v11 = [(CAMExpandingControlMenuItem *)v5 selectedSubtitle];
          if ([v10 isEqualToString:v11])
          {
            id v12 = [(CAMExpandingControlMenuItem *)self _configuration];
            id v13 = [(CAMExpandingControlMenuItem *)v5 _configuration];
            char v14 = [v12 isEqualToConfiguration:v13];
          }
          else
          {
            char v14 = 0;
          }
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSValue)state
{
  return self->_state;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)selectedSubtitle
{
  return self->_selectedSubtitle;
}

- (CAMExpandingControlMenuItemConfiguration)_configuration
{
  return self->__configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__configuration, 0);
  objc_storeStrong((id *)&self->_selectedSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end