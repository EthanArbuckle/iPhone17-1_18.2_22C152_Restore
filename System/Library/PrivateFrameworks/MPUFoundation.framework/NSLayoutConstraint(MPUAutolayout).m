@interface NSLayoutConstraint(MPUAutolayout)
+ (id)constraintsByAttachingView:()MPUAutolayout toView:alongEdges:insets:;
+ (id)constraintsByAttachingView:()MPUAutolayout toView:inCorner:offset:;
+ (id)constraintsByCenteringAndContainingView:()MPUAutolayout inView:insets:;
+ (id)constraintsByCenteringView:()MPUAutolayout withView:alongAxes:offset:;
+ (id)constraintsBySizingView:()MPUAutolayout toSize:;
@end

@implementation NSLayoutConstraint(MPUAutolayout)

+ (id)constraintsByCenteringView:()MPUAutolayout withView:alongAxes:offset:
{
  id v11 = a5;
  id v12 = a6;
  v13 = [MEMORY[0x263EFF980] array];
  if (a7)
  {
    v14 = [MEMORY[0x263F08938] constraintWithItem:v11 attribute:9 relatedBy:0 toItem:v12 attribute:9 multiplier:1.0 constant:a1];
    [v13 addObject:v14];
  }
  if ((a7 & 2) != 0)
  {
    v15 = [MEMORY[0x263F08938] constraintWithItem:v11 attribute:10 relatedBy:0 toItem:v12 attribute:10 multiplier:1.0 constant:a2];
    [v13 addObject:v15];
  }

  return v13;
}

+ (id)constraintsByAttachingView:()MPUAutolayout toView:alongEdges:insets:
{
  id v15 = a7;
  id v16 = a8;
  v17 = [MEMORY[0x263EFF980] array];
  if (a9)
  {
    v20 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:3 relatedBy:0 toItem:v16 attribute:3 multiplier:1.0 constant:a1];
    [v17 addObject:v20];

    if ((a9 & 4) == 0)
    {
LABEL_3:
      if ((a9 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((a9 & 4) == 0)
  {
    goto LABEL_3;
  }
  v21 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:4 relatedBy:0 toItem:v16 attribute:4 multiplier:1.0 constant:-a3];
  [v17 addObject:v21];

  if ((a9 & 2) == 0)
  {
LABEL_4:
    if ((a9 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v22 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:5 relatedBy:0 toItem:v16 attribute:5 multiplier:1.0 constant:a2];
  [v17 addObject:v22];

  if ((a9 & 8) != 0)
  {
LABEL_5:
    v18 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:6 relatedBy:0 toItem:v16 attribute:6 multiplier:1.0 constant:-a4];
    [v17 addObject:v18];
  }
LABEL_6:

  return v17;
}

+ (id)constraintsByCenteringAndContainingView:()MPUAutolayout inView:insets:
{
  v13 = (void *)MEMORY[0x263EFF980];
  id v14 = a8;
  id v15 = a7;
  id v16 = [v13 array];
  v17 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:9 relatedBy:0 toItem:v14 attribute:9 multiplier:1.0 constant:(a2 - a4) * 0.5];
  [v16 addObject:v17];
  v18 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:10 relatedBy:0 toItem:v14 attribute:10 multiplier:1.0 constant:(a1 - a3) * 0.5];
  [v16 addObject:v18];
  double v19 = -(a2 + a4);
  v20 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:7 relatedBy:-1 toItem:v14 attribute:7 multiplier:1.0 constant:v19];
  [v16 addObject:v20];
  v21 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:7 relatedBy:0 toItem:v14 attribute:7 multiplier:1.0 constant:v19];
  LODWORD(v22) = 1144750080;
  [v21 setPriority:v22];
  [v16 addObject:v21];
  double v23 = -(a1 + a3);
  v24 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:8 relatedBy:-1 toItem:v14 attribute:8 multiplier:1.0 constant:v23];
  [v16 addObject:v24];
  v25 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:8 relatedBy:0 toItem:v14 attribute:8 multiplier:1.0 constant:v23];

  LODWORD(v26) = 1144750080;
  [v25 setPriority:v26];
  [v16 addObject:v25];

  return v16;
}

+ (id)constraintsByAttachingView:()MPUAutolayout toView:inCorner:offset:
{
  double v7 = a2;
  double v8 = a1;
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v10 = 5;
  uint64_t v11 = 3;
  switch(a7)
  {
    case 1:
      break;
    case 2:
      double v8 = -a1;
      uint64_t v10 = 6;
      uint64_t v11 = 3;
      break;
    case 4:
      double v7 = -a2;
      uint64_t v10 = 5;
      goto LABEL_6;
    case 8:
      double v8 = -a1;
      double v7 = -a2;
      uint64_t v10 = 6;
LABEL_6:
      uint64_t v11 = 4;
      break;
    default:
      uint64_t v11 = 0;
      uint64_t v10 = 0;
      break;
  }
  id v12 = (void *)MEMORY[0x263F08938];
  id v13 = a6;
  id v14 = a5;
  id v15 = [v12 constraintWithItem:v14 attribute:9 relatedBy:0 toItem:v13 attribute:v10 multiplier:1.0 constant:v8];
  id v16 = [MEMORY[0x263F08938] constraintWithItem:v14 attribute:10 relatedBy:0 toItem:v13 attribute:v11 multiplier:1.0 constant:v7];

  v19[0] = v15;
  v19[1] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];

  return v17;
}

+ (id)constraintsBySizingView:()MPUAutolayout toSize:
{
  id v7 = a5;
  double v8 = [MEMORY[0x263EFF980] array];
  if (a1 != -1.0)
  {
    v9 = [MEMORY[0x263F08938] constraintWithItem:v7 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:a1];
    [v8 addObject:v9];
  }
  if (a2 != -1.0)
  {
    uint64_t v10 = [MEMORY[0x263F08938] constraintWithItem:v7 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:a2];
    [v8 addObject:v10];
  }

  return v8;
}

@end