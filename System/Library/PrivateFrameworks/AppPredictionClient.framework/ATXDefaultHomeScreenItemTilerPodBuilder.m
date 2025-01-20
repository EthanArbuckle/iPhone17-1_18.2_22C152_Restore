@interface ATXDefaultHomeScreenItemTilerPodBuilder
- (ATXDefaultHomeScreenItemTilerHelper)tilerHelper;
- (ATXDefaultHomeScreenItemTilerPodBuilder)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8;
- (ATXDefaultWidgetStack)defaultStack;
- (NSArray)tiledHomeScreenItems;
- (NSMutableArray)defaultWidgetsExtraLarge;
- (NSMutableArray)defaultWidgetsLarge;
- (NSMutableArray)defaultWidgetsMedium;
- (NSMutableArray)defaultWidgetsSmall;
- (unint64_t)_addPod:(id)a3 podType:(unint64_t)a4 podsAdded:(unint64_t)a5;
- (unint64_t)_addPodTypeFourSmalls:(id)a3;
- (unint64_t)_addPodTypeOneExtraLarge:(id)a3 podsAdded:(unint64_t)a4;
- (unint64_t)_addPodTypeOneLarge:(id)a3;
- (unint64_t)_addPodTypeOneMediumAndTwoSmalls:(id)a3;
- (unint64_t)_addPodTypeTwoMediums:(id)a3;
- (unint64_t)_addPodTypeTwoSmallsAndOneMedium:(id)a3;
- (unint64_t)addFirstPod:(id)a3;
- (unint64_t)addPod:(id)a3 podType:(unint64_t)a4 allowAlternatePodTypeAsBackup:(BOOL)a5 podsAdded:(unint64_t)a6;
- (unint64_t)widgetFamilyMask;
- (void)setDefaultStack:(id)a3;
- (void)setDefaultWidgetsExtraLarge:(id)a3;
- (void)setDefaultWidgetsLarge:(id)a3;
- (void)setDefaultWidgetsMedium:(id)a3;
- (void)setDefaultWidgetsSmall:(id)a3;
- (void)setTilerHelper:(id)a3;
- (void)setWidgetFamilyMask:(unint64_t)a3;
@end

@implementation ATXDefaultHomeScreenItemTilerPodBuilder

- (ATXDefaultHomeScreenItemTilerPodBuilder)initWithDefaultStack:(id)a3 defaultWidgetsSmall:(id)a4 defaultWidgetsMedium:(id)a5 defaultWidgetsLarge:(id)a6 defaultWidgetsExtraLarge:(id)a7 widgetFamilyMask:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v33.receiver = self;
  v33.super_class = (Class)ATXDefaultHomeScreenItemTilerPodBuilder;
  v20 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)&v33 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_defaultStack, a3);
    uint64_t v22 = [v16 mutableCopy];
    defaultWidgetsSmall = v21->_defaultWidgetsSmall;
    v21->_defaultWidgetsSmall = (NSMutableArray *)v22;

    uint64_t v24 = [v17 mutableCopy];
    defaultWidgetsMedium = v21->_defaultWidgetsMedium;
    v21->_defaultWidgetsMedium = (NSMutableArray *)v24;

    uint64_t v26 = [v18 mutableCopy];
    defaultWidgetsLarge = v21->_defaultWidgetsLarge;
    v21->_defaultWidgetsLarge = (NSMutableArray *)v26;

    uint64_t v28 = [v19 mutableCopy];
    defaultWidgetsExtraLarge = v21->_defaultWidgetsExtraLarge;
    v21->_defaultWidgetsExtraLarge = (NSMutableArray *)v28;

    v21->_widgetFamilyMask = a8;
    uint64_t v30 = objc_opt_new();
    tilerHelper = v21->_tilerHelper;
    v21->_tilerHelper = (ATXDefaultHomeScreenItemTilerHelper *)v30;
  }
  return v21;
}

- (NSArray)tiledHomeScreenItems
{
  v2 = objc_opt_new();

  return (NSArray *)v2;
}

- (unint64_t)addFirstPod:(id)a3
{
  id v4 = a3;
  if ((self->_widgetFamilyMask & 2) != 0
    && [(ATXDefaultWidgetStack *)self->_defaultStack suggestedSize] == 1
    && (unint64_t)[(NSMutableArray *)self->_defaultWidgetsSmall count] >= 2)
  {
    v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    uint64_t v6 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    v7 = (void *)v6;
    if (self->_defaultStack && v5 && v6)
    {
      objc_msgSend(v4, "addObject:");
      [v4 addObject:v5];
      [v4 addObject:v7];
      unint64_t v8 = 1;
    }
    else
    {
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v5];
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v7];
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)addPod:(id)a3 podType:(unint64_t)a4 allowAlternatePodTypeAsBackup:(BOOL)a5 podsAdded:(unint64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  unint64_t v11 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self _addPod:v10 podType:a4 podsAdded:a6];
  if (!v11 && v7)
  {
    uint64_t v12 = 0;
    while (1)
    {
      if (a4 != v12)
      {
        unint64_t v13 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self _addPod:v10 podType:v12 podsAdded:a6];
        if (v13) {
          break;
        }
      }
      if (++v12 == 6)
      {
        unint64_t v11 = 0;
        goto LABEL_9;
      }
    }
    unint64_t v11 = v13;
  }
LABEL_9:

  return v11;
}

- (unint64_t)_addPod:(id)a3 podType:(unint64_t)a4 podsAdded:(unint64_t)a5
{
  id v8 = a3;
  switch(a4)
  {
    case 0uLL:
      unint64_t v9 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self _addPodTypeOneMediumAndTwoSmalls:v8];
      goto LABEL_9;
    case 1uLL:
      unint64_t v9 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self _addPodTypeTwoSmallsAndOneMedium:v8];
      goto LABEL_9;
    case 2uLL:
      unint64_t v9 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self _addPodTypeTwoMediums:v8];
      goto LABEL_9;
    case 3uLL:
      unint64_t v9 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self _addPodTypeOneLarge:v8];
      goto LABEL_9;
    case 4uLL:
      unint64_t v9 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self _addPodTypeFourSmalls:v8];
      goto LABEL_9;
    case 5uLL:
      unint64_t v9 = [(ATXDefaultHomeScreenItemTilerPodBuilder *)self _addPodTypeOneExtraLarge:v8 podsAdded:a5];
LABEL_9:
      unint64_t v10 = v9;
      break;
    default:
      unint64_t v10 = 0;
      break;
  }

  return v10;
}

- (unint64_t)_addPodTypeFourSmalls:(id)a3
{
  id v4 = a3;
  if ((self->_widgetFamilyMask & 2) == 0
    || (unint64_t)[(NSMutableArray *)self->_defaultWidgetsSmall count] < 4)
  {
    goto LABEL_20;
  }
  v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
  uint64_t v6 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
  BOOL v7 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
  uint64_t v8 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
  unint64_t v9 = (void *)v8;
  BOOL v10 = !v5 || v6 == 0;
  BOOL v11 = v10 || v7 == 0;
  BOOL v12 = v11 || v8 == 0;
  BOOL v13 = !v12;
  if (v12)
  {
    [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v5];
    [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v6];
    [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v7];
    [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v9];
  }
  else
  {
    [v4 addObject:v5];
    [v4 addObject:v6];
    [v4 addObject:v7];
    [v4 addObject:v9];
  }

  if (v13) {
    unint64_t v14 = 1;
  }
  else {
LABEL_20:
  }
    unint64_t v14 = 0;

  return v14;
}

- (unint64_t)_addPodTypeTwoMediums:(id)a3
{
  id v4 = a3;
  if ((self->_widgetFamilyMask & 4) != 0
    && (unint64_t)[(NSMutableArray *)self->_defaultWidgetsMedium count] >= 2)
  {
    v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsMedium];
    uint64_t v6 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsMedium];
    BOOL v7 = (void *)v6;
    if (v5 && v6)
    {
      [v4 addObject:v5];
      [v4 addObject:v7];
      unint64_t v8 = 1;
    }
    else
    {
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v5];
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v7];
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)_addPodTypeOneLarge:(id)a3
{
  id v4 = a3;
  if ((self->_widgetFamilyMask & 8) == 0 || ![(NSMutableArray *)self->_defaultWidgetsLarge count]) {
    goto LABEL_6;
  }
  uint64_t v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsLarge];
  if (!v5)
  {
    [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:0];
LABEL_6:
    unint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = (void *)v5;
  [v4 addObject:v5];

  unint64_t v7 = 1;
LABEL_7:

  return v7;
}

- (unint64_t)_addPodTypeOneExtraLarge:(id)a3 podsAdded:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  unint64_t v7 = 0;
  if ((v4 & 1) == 0 && (self->_widgetFamilyMask & 0x10) != 0)
  {
    if ([(NSMutableArray *)self->_defaultWidgetsExtraLarge count])
    {
      unint64_t v7 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsExtraLarge];
      if (v7)
      {
        [v6 addObject:v7];

        unint64_t v7 = 2;
      }
      else
      {
        [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:0];
      }
    }
    else
    {
      unint64_t v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)_addPodTypeOneMediumAndTwoSmalls:(id)a3
{
  id v4 = a3;
  if ((~LODWORD(self->_widgetFamilyMask) & 6) != 0
    || ![(NSMutableArray *)self->_defaultWidgetsMedium count]
    || (unint64_t)[(NSMutableArray *)self->_defaultWidgetsSmall count] < 2)
  {
    unint64_t v9 = 0;
  }
  else
  {
    uint64_t v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsMedium];
    id v6 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    uint64_t v7 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    unint64_t v8 = (void *)v7;
    if (v5 && v6 && v7)
    {
      [v4 addObject:v5];
      [v4 addObject:v6];
      [v4 addObject:v8];
      unint64_t v9 = 1;
    }
    else
    {
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v5];
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v6];
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v8];
      unint64_t v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)_addPodTypeTwoSmallsAndOneMedium:(id)a3
{
  id v4 = a3;
  if ((~LODWORD(self->_widgetFamilyMask) & 6) != 0
    || ![(NSMutableArray *)self->_defaultWidgetsMedium count]
    || (unint64_t)[(NSMutableArray *)self->_defaultWidgetsSmall count] < 2)
  {
    unint64_t v9 = 0;
  }
  else
  {
    uint64_t v5 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsMedium];
    id v6 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    uint64_t v7 = [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper filterForNextUnusedWidgetDescriptor:self->_defaultWidgetsSmall];
    unint64_t v8 = (void *)v7;
    if (v5 && v6 && v7)
    {
      [v4 addObject:v6];
      [v4 addObject:v8];
      [v4 addObject:v5];
      unint64_t v9 = 1;
    }
    else
    {
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v6];
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v8];
      [(ATXDefaultHomeScreenItemTilerHelper *)self->_tilerHelper unmarkWidgetAsUsed:v5];
      unint64_t v9 = 0;
    }
  }
  return v9;
}

- (ATXDefaultWidgetStack)defaultStack
{
  return self->_defaultStack;
}

- (void)setDefaultStack:(id)a3
{
}

- (NSMutableArray)defaultWidgetsSmall
{
  return self->_defaultWidgetsSmall;
}

- (void)setDefaultWidgetsSmall:(id)a3
{
}

- (NSMutableArray)defaultWidgetsMedium
{
  return self->_defaultWidgetsMedium;
}

- (void)setDefaultWidgetsMedium:(id)a3
{
}

- (NSMutableArray)defaultWidgetsLarge
{
  return self->_defaultWidgetsLarge;
}

- (void)setDefaultWidgetsLarge:(id)a3
{
}

- (NSMutableArray)defaultWidgetsExtraLarge
{
  return self->_defaultWidgetsExtraLarge;
}

- (void)setDefaultWidgetsExtraLarge:(id)a3
{
}

- (unint64_t)widgetFamilyMask
{
  return self->_widgetFamilyMask;
}

- (void)setWidgetFamilyMask:(unint64_t)a3
{
  self->_widgetFamilyMask = a3;
}

- (ATXDefaultHomeScreenItemTilerHelper)tilerHelper
{
  return self->_tilerHelper;
}

- (void)setTilerHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilerHelper, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsExtraLarge, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsLarge, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsMedium, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsSmall, 0);

  objc_storeStrong((id *)&self->_defaultStack, 0);
}

@end