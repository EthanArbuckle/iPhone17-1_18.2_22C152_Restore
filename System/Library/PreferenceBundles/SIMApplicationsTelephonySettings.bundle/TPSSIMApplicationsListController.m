@interface TPSSIMApplicationsListController
- (TPSSIMApplicationsController)SIMApplicationsController;
- (TPSSIMApplicationsController)simApplicationsController;
- (id)specifiers;
- (void)handleApplicationButtonAction:(id)a3;
@end

@implementation TPSSIMApplicationsListController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->TPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(TPSSIMApplicationsListController *)self subscriptionContext];
    if (v5)
    {
      v6 = +[NSMutableArray array];
      v7 = [(TPSSIMApplicationsListController *)self SIMApplicationsController];
      v8 = [v7 localizedSubtitlesForSubscriptionContext:v5];

      if ([v8 count])
      {
        v9 = [(TPSSIMApplicationsListController *)self SIMApplicationsController];
        v10 = [v9 localizedTitleForSubscriptionContext:v5];

        v11 = &NSStringFromClass_ptr;
        uint64_t v21 = v3;
        if ([v10 length]) {
          +[PSSpecifier groupSpecifierWithName:v10];
        }
        else {
        v12 = +[PSSpecifier emptyGroupSpecifier];
        }
        [v6 addObject:v12];

        if ([v8 count])
        {
          unint64_t v13 = 0;
          do
          {
            v14 = [v8 objectAtIndexedSubscript:v13];
            [v11[39] preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:13 edit:0];
            v16 = v15 = v11;
            [v16 setButtonAction:"handleApplicationButtonAction:"];
            v17 = +[NSNumber numberWithUnsignedInteger:v13];
            [v16 setUserInfo:v17];

            [v6 addObject:v16];
            v11 = v15;

            ++v13;
          }
          while (v13 < (unint64_t)[v8 count]);
        }

        uint64_t v3 = v21;
      }
      id v18 = [v6 copy];
      v19 = *(void **)&self->TPSListController_opaque[v3];
      *(void *)&self->TPSListController_opaque[v3] = v18;
    }
    v4 = *(void **)&self->TPSListController_opaque[v3];
  }

  return v4;
}

- (TPSSIMApplicationsController)SIMApplicationsController
{
  p_SIMApplicationsController = &self->_SIMApplicationsController;
  SIMApplicationsController = self->_SIMApplicationsController;
  if (!SIMApplicationsController)
  {
    v4 = [(TPSSIMApplicationsListController *)self specifier];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = [v4 propertyForKey:v6];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)p_SIMApplicationsController, v7);
    }

    SIMApplicationsController = *p_SIMApplicationsController;
  }

  return SIMApplicationsController;
}

- (void)handleApplicationButtonAction:(id)a3
{
  id v6 = [a3 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(TPSSIMApplicationsListController *)self SIMApplicationsController];
    v5 = [(TPSSIMApplicationsListController *)self subscriptionContext];
    [v4 openApplicationAtIndex:v6 forSubscriptionContext:v5];
  }
}

- (TPSSIMApplicationsController)simApplicationsController
{
  return self->_simApplicationsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simApplicationsController, 0);

  objc_storeStrong((id *)&self->_SIMApplicationsController, 0);
}

@end