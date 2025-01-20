@interface CNCustomCardAction
+ (id)groupForActionGivenPlacement:(int64_t)a3 inContactContentViewController:(id)a4;
+ (int64_t)placementForGroup:(id)a3 inContactContentViewController:(id)a4;
- (BOOL)isDestructive;
- (BOOL)isValidForContact:(id)a3;
- (BOOL)matchesTarget:(id)a3 selector:(SEL)a4 group:(id)a5 inContactContentViewController:(id)a6;
- (CNContactTargetActionWrapper)targetActionWrapper;
- (CNCustomCardAction)initWithTitle:(id)a3 targetActionWrapper:(id)a4 contactIdentifier:(id)a5 placement:(int64_t)a6 isDestructive:(BOOL)a7 menuProvider:(id)a8;
- (NSString)contactIdentifier;
- (NSString)title;
- (id)menuProvider;
- (int64_t)placement;
@end

@implementation CNCustomCardAction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_menuProvider, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_targetActionWrapper, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (id)menuProvider
{
  return self->_menuProvider;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (int64_t)placement
{
  return self->_placement;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (CNContactTargetActionWrapper)targetActionWrapper
{
  return self->_targetActionWrapper;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)matchesTarget:(id)a3 selector:(SEL)a4 group:(id)a5 inContactContentViewController:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  uint64_t v13 = [(id)objc_opt_class() placementForGroup:v12 inContactContentViewController:v11];

  if (v13 == [(CNCustomCardAction *)self placement])
  {
    v14 = [(CNCustomCardAction *)self targetActionWrapper];
    id v15 = [v14 target];
    if (v15 == v10)
    {
      v17 = [(CNCustomCardAction *)self targetActionWrapper];
      BOOL v16 = [v17 action] == (void)a4;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)isValidForContact:(id)a3
{
  v4 = [a3 identifier];
  v5 = [(CNCustomCardAction *)self contactIdentifier];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (CNCustomCardAction)initWithTitle:(id)a3 targetActionWrapper:(id)a4 contactIdentifier:(id)a5 placement:(int64_t)a6 isDestructive:(BOOL)a7 menuProvider:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  if (!a6)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"CNCustomCardAction.m" lineNumber:42 description:@"placement should not be undefined"];
  }
  v27.receiver = self;
  v27.super_class = (Class)CNCustomCardAction;
  v19 = [(CNCustomCardAction *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_title, a3);
    objc_storeStrong((id *)&v20->_targetActionWrapper, a4);
    objc_storeStrong((id *)&v20->_contactIdentifier, a5);
    v20->_placement = a6;
    v20->_destructive = a7;
    v21 = _Block_copy(v18);
    id menuProvider = v20->_menuProvider;
    v20->_id menuProvider = v21;

    v23 = v20;
  }

  return v20;
}

+ (id)groupForActionGivenPlacement:(int64_t)a3 inContactContentViewController:(id)a4
{
  id v5 = a4;
  char v6 = v5;
  switch(a3)
  {
    case 3:
      uint64_t v7 = [v5 cardFooterGroup];
      goto LABEL_7;
    case 2:
      uint64_t v7 = [v5 cardBottomGroup];
      goto LABEL_7;
    case 1:
      uint64_t v7 = [v5 cardTopGroup];
LABEL_7:
      v8 = (void *)v7;
      goto LABEL_9;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

+ (int64_t)placementForGroup:(id)a3 inContactContentViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 cardTopGroup];

  if (v7 == v5)
  {
    int64_t v10 = 1;
  }
  else
  {
    id v8 = [v6 cardBottomGroup];

    if (v8 == v5)
    {
      int64_t v10 = 2;
    }
    else
    {
      id v9 = [v6 cardFooterGroup];

      if (v9 == v5) {
        int64_t v10 = 3;
      }
      else {
        int64_t v10 = 0;
      }
    }
  }

  return v10;
}

@end