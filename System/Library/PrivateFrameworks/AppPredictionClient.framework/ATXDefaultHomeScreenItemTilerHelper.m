@interface ATXDefaultHomeScreenItemTilerHelper
- (ATXDefaultHomeScreenItemTilerHelper)init;
- (BOOL)_isSpecialAvocadoDescriptorKind:(id)a3;
- (BOOL)_isWidgetAlreadyUsed:(id)a3;
- (id)filterForNextUnusedWidgetDescriptor:(id)a3;
- (void)_markWidgetAsUsed:(id)a3;
- (void)unmarkWidgetAsUsed:(id)a3;
@end

@implementation ATXDefaultHomeScreenItemTilerHelper

- (ATXDefaultHomeScreenItemTilerHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXDefaultHomeScreenItemTilerHelper;
  v2 = [(ATXDefaultHomeScreenItemTilerHelper *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    usedBundleIds = v2->_usedBundleIds;
    v2->_usedBundleIds = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    usedSpecialKinds = v2->_usedSpecialKinds;
    v2->_usedSpecialKinds = (NSMutableSet *)v5;
  }
  return v2;
}

- (void)unmarkWidgetAsUsed:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    uint64_t v5 = [v4 appBundleId];
    if (v5)
    {
      [(NSMutableSet *)self->_usedBundleIds removeObject:v5];
    }
    else
    {
      v6 = [v12 avocadoDescriptor];
      v7 = [v6 kind];
      BOOL v8 = [(ATXDefaultHomeScreenItemTilerHelper *)self _isSpecialAvocadoDescriptorKind:v7];

      if (v8)
      {
        usedSpecialKinds = self->_usedSpecialKinds;
        v10 = [v12 avocadoDescriptor];
        v11 = [v10 kind];
        [(NSMutableSet *)usedSpecialKinds removeObject:v11];
      }
    }

    id v4 = v12;
  }
}

- (id)filterForNextUnusedWidgetDescriptor:(id)a3
{
  id v4 = a3;
  for (i = v4; ; id v4 = i)
  {
    if (![v4 count])
    {
      v6 = 0;
      goto LABEL_8;
    }
    v6 = [i objectAtIndexedSubscript:0];
    [i removeObjectAtIndex:0];
    v7 = [v6 avocadoDescriptor];

    if (v7)
    {
      if (![(ATXDefaultHomeScreenItemTilerHelper *)self _isWidgetAlreadyUsed:v6]) {
        break;
      }
    }
  }
  [(ATXDefaultHomeScreenItemTilerHelper *)self _markWidgetAsUsed:v6];
LABEL_8:

  return v6;
}

- (BOOL)_isSpecialAvocadoDescriptorKind:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"SBHSpecialAvocadoDescriptorKindSiri"] & 1) != 0
    || ([v3 isEqualToString:@"SBHSpecialAvocadoDescriptorKindFiles"] & 1) != 0
    || ([v3 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsSingle"] & 1) != 0
    || ([v3 isEqualToString:@"SBHSpecialAvocadoDescriptorKindShortcutsFolder"] & 1) != 0
    || ([v3 isEqualToString:@"SBHSpecialAvocadoDescriptorKindSmartStack"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"SBHSpecialAvocadoDescriptorKindAppPredictions"];
  }

  return v4;
}

- (BOOL)_isWidgetAlreadyUsed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 appBundleId];
  if (v5)
  {
    if (([(NSMutableSet *)self->_usedBundleIds containsObject:v5] & 1) == 0)
    {
LABEL_7:
      BOOL v12 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v6 = [v4 avocadoDescriptor];
    v7 = [v6 kind];
    BOOL v8 = [(ATXDefaultHomeScreenItemTilerHelper *)self _isSpecialAvocadoDescriptorKind:v7];

    if (!v8) {
      goto LABEL_7;
    }
    usedSpecialKinds = self->_usedSpecialKinds;
    v10 = [v4 avocadoDescriptor];
    v11 = [v10 kind];
    LOBYTE(usedSpecialKinds) = [(NSMutableSet *)usedSpecialKinds containsObject:v11];

    if ((usedSpecialKinds & 1) == 0) {
      goto LABEL_7;
    }
  }
  BOOL v12 = 1;
LABEL_8:

  return v12;
}

- (void)_markWidgetAsUsed:(id)a3
{
  id v11 = a3;
  id v4 = [v11 appBundleId];
  if (v4)
  {
    [(NSMutableSet *)self->_usedBundleIds addObject:v4];
  }
  else
  {
    uint64_t v5 = [v11 avocadoDescriptor];
    v6 = [v5 kind];
    BOOL v7 = [(ATXDefaultHomeScreenItemTilerHelper *)self _isSpecialAvocadoDescriptorKind:v6];

    if (v7)
    {
      usedSpecialKinds = self->_usedSpecialKinds;
      v9 = [v11 avocadoDescriptor];
      v10 = [v9 kind];
      [(NSMutableSet *)usedSpecialKinds addObject:v10];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedSpecialKinds, 0);

  objc_storeStrong((id *)&self->_usedBundleIds, 0);
}

@end