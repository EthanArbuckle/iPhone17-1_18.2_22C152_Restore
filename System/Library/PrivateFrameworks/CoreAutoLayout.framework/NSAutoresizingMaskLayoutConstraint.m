@interface NSAutoresizingMaskLayoutConstraint
+ (id)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 constant:(double)a9;
+ (id)constraintsWithAutoresizingMask:(unint64_t)a3 subitem:(id)a4 frame:(CGRect)a5 superitem:(id)a6 bounds:(CGRect)a7;
- (id)_viewForAutoresizingMask;
- (id)descriptionAccessory;
- (int)_constraintType;
@end

@implementation NSAutoresizingMaskLayoutConstraint

+ (id)constraintsWithAutoresizingMask:(unint64_t)a3 subitem:(id)a4 frame:(CGRect)a5 superitem:(id)a6 bounds:(CGRect)a7
{
  if (a3)
  {
    double height = a7.size.height;
    double width = a7.size.width;
    double y = a7.origin.y;
    double x = a7.origin.x;
    double v12 = a5.size.height;
    double v13 = a5.size.width;
    double v14 = a5.origin.y;
    double v15 = a5.origin.x;
    v18 = (void *)[MEMORY[0x1E4F1CA48] array];
    switch(a3 & 7)
    {
      case 1uLL:
        v19 = +[NSLayoutConstraint constraintWithItem:a6 attribute:7 relatedBy:0 toItem:a4 attribute:36 constant:x + width - (v15 + v13)];
        goto LABEL_8;
      case 2uLL:
        objc_msgSend(v18, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:constant:", a4, 32, 0, v15 - x));
        v22 = +[NSLayoutConstraint constraintWithItem:a6 attribute:7 relatedBy:0 toItem:a4 attribute:36 constant:x + width - (v15 + v13)];
        break;
      case 3uLL:
        double v23 = x + width - (v15 + v13);
        double v24 = width - v23;
        if (width - v23 == 0.0)
        {
          double v25 = *(double *)&NSISEpsilon;
          double v26 = 0.5;
          if (*(double *)&NSISEpsilon > 0.0) {
            goto LABEL_13;
          }
          goto LABEL_12;
        }
        double v25 = fabs(v24);
        double v26 = 0.5;
        if (v25 >= *(double *)&NSISEpsilon) {
LABEL_12:
        }
          double v26 = v13 / v24;
LABEL_13:
        v27 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:constant:", a6, 7, 0, a4, 36, v23, v25);
        goto LABEL_22;
      case 5uLL:
        double v28 = width - v13;
        if (width - v13 == 0.0)
        {
          double v26 = 0.5;
          if (*(double *)&NSISEpsilon > 0.0) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
        double v26 = 0.5;
        if (fabs(v28) >= *(double *)&NSISEpsilon) {
LABEL_16:
        }
          double v26 = (v15 - x) / v28;
LABEL_17:
        objc_msgSend(v18, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:constant:", a4, 7, 0, v13));
        double v29 = -(v13 * v26);
        id v30 = a4;
        uint64_t v31 = 32;
        goto LABEL_23;
      case 6uLL:
        double v23 = v15 - x;
        double v32 = width - v23;
        if (width - v23 == 0.0)
        {
          double v33 = *(double *)&NSISEpsilon;
          double v26 = 1.0;
          if (*(double *)&NSISEpsilon > 0.0) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
        double v33 = fabs(v32);
        double v26 = 1.0;
        if (v33 >= *(double *)&NSISEpsilon) {
LABEL_20:
        }
          double v26 = v13 / v32;
LABEL_21:
        v27 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:constant:", a4, 32, 0, v23, v33);
LABEL_22:
        [v18 addObject:v27];
        double v29 = -(v23 * v26);
        id v30 = a4;
        uint64_t v31 = 7;
LABEL_23:
        v22 = +[NSAutoresizingMaskLayoutConstraint constraintWithItem:v30 attribute:v31 relatedBy:0 toItem:a6 attribute:7 multiplier:v26 constant:v29];
        break;
      case 7uLL:
        if (width == 0.0)
        {
          if (*(double *)&NSISEpsilon > 0.0)
          {
LABEL_26:
            double v34 = 0.333333333;
            goto LABEL_35;
          }
        }
        else if (fabs(width) < *(double *)&NSISEpsilon)
        {
          goto LABEL_26;
        }
        double v34 = (v15 - x) / width;
LABEL_35:
        objc_msgSend(v18, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:", a4, 32, 0, a6, 7, v34));
        if (width == 0.0)
        {
          if (*(double *)&NSISEpsilon > 0.0)
          {
LABEL_37:
            double v35 = 0.333333333;
            goto LABEL_40;
          }
        }
        else if (fabs(width) < *(double *)&NSISEpsilon)
        {
          goto LABEL_37;
        }
        double v35 = v13 / width;
LABEL_40:
        v22 = +[NSLayoutConstraint constraintWithItem:a4 attribute:7 relatedBy:0 toItem:a6 attribute:7 multiplier:v35];
        break;
      default:
        v19 = +[NSLayoutConstraint constraintWithItem:a4 attribute:32 relatedBy:0 constant:v15 - x];
LABEL_8:
        [v18 addObject:v19];
        v22 = +[NSLayoutConstraint constraintWithItem:a4 attribute:7 relatedBy:0 constant:v13];
        break;
    }
    [v18 addObject:v22];
    switch((a3 >> 3) & 7)
    {
      case 1uLL:
        objc_msgSend(v18, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:constant:", a6, 8, 0, a4, 37, y + height - (v14 + v12)));
        goto LABEL_44;
      case 2uLL:
        objc_msgSend(v18, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:constant:", a4, 33, 0, v14 - y));
        v36 = +[NSLayoutConstraint constraintWithItem:a6 attribute:8 relatedBy:0 toItem:a4 attribute:37 constant:y + height - (v14 + v12)];
        goto LABEL_77;
      case 3uLL:
        double v37 = y + height - (v14 + v12);
        double v38 = height - v37;
        if (height - v37 == 0.0)
        {
          double v39 = *(double *)&NSISEpsilon;
          double v40 = 0.5;
          if (*(double *)&NSISEpsilon > 0.0) {
            goto LABEL_49;
          }
          goto LABEL_48;
        }
        double v39 = fabs(v38);
        double v40 = 0.5;
        if (v39 >= *(double *)&NSISEpsilon) {
LABEL_48:
        }
          double v40 = v12 / v38;
LABEL_49:
        v41 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:constant:", a6, 8, 0, a4, 37, v37, v39);
        goto LABEL_58;
      case 5uLL:
        double v42 = height - v12;
        if (height - v12 == 0.0)
        {
          double v40 = 0.5;
          if (*(double *)&NSISEpsilon > 0.0) {
            goto LABEL_53;
          }
          goto LABEL_52;
        }
        double v40 = 0.5;
        if (fabs(v42) >= *(double *)&NSISEpsilon) {
LABEL_52:
        }
          double v40 = (v14 - y) / v42;
LABEL_53:
        objc_msgSend(v18, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:constant:", a4, 8, 0, v12));
        double v43 = -(v12 * v40);
        id v44 = a4;
        uint64_t v45 = 33;
        goto LABEL_59;
      case 6uLL:
        double v37 = v14 - y;
        double v46 = height - v37;
        if (height - v37 == 0.0)
        {
          double v47 = *(double *)&NSISEpsilon;
          double v40 = 1.0;
          if (*(double *)&NSISEpsilon > 0.0) {
            goto LABEL_57;
          }
          goto LABEL_56;
        }
        double v47 = fabs(v46);
        double v40 = 1.0;
        if (v47 >= *(double *)&NSISEpsilon) {
LABEL_56:
        }
          double v40 = v12 / v46;
LABEL_57:
        v41 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:constant:", a4, 33, 0, v37, v47);
LABEL_58:
        [v18 addObject:v41];
        double v43 = -(v37 * v40);
        id v44 = a4;
        uint64_t v45 = 8;
LABEL_59:
        v36 = +[NSAutoresizingMaskLayoutConstraint constraintWithItem:v44 attribute:v45 relatedBy:0 toItem:a6 attribute:8 multiplier:v40 constant:v43];
        goto LABEL_77;
      case 7uLL:
        if (height == 0.0)
        {
          if (*(double *)&NSISEpsilon > 0.0)
          {
LABEL_62:
            double v48 = 0.333333333;
            goto LABEL_71;
          }
        }
        else if (fabs(height) < *(double *)&NSISEpsilon)
        {
          goto LABEL_62;
        }
        double v48 = (v14 - y) / height;
LABEL_71:
        objc_msgSend(v18, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:", a4, 33, 0, a6, 8, v48));
        if (height == 0.0)
        {
          if (*(double *)&NSISEpsilon > 0.0)
          {
LABEL_73:
            double v49 = 0.333333333;
            goto LABEL_76;
          }
        }
        else if (fabs(height) < *(double *)&NSISEpsilon)
        {
          goto LABEL_73;
        }
        double v49 = v12 / height;
LABEL_76:
        v36 = +[NSLayoutConstraint constraintWithItem:a4 attribute:8 relatedBy:0 toItem:a6 attribute:8 multiplier:v49];
LABEL_77:
        [v18 addObject:v36];
        id result = v18;
        break;
      default:
        objc_msgSend(v18, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:constant:", a4, 33, 0, v14 - y));
LABEL_44:
        v36 = +[NSLayoutConstraint constraintWithItem:a4 attribute:8 relatedBy:0 constant:v12];
        goto LABEL_77;
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F1C978];
    return (id)objc_msgSend(v20, "array", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height);
  }
  return result;
}

+ (id)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 constant:(double)a9
{
  if (a3
    && a4 <= 0x25
    && ((1 << a4) & 0x3F001FFE7FLL) != 0
    && (a4 - 32) >= 6
    && a4
    || a6
    && a7 <= 0x25
    && ((1 << a7) & 0x3F001FFE7FLL) != 0
    && (a7 - 32) >= 6
    && a7)
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unknown layout attribute" userInfo:0]);
  }
  v16 = (char *)objc_alloc_init((Class)objc_opt_class());
  *(_DWORD *)(v16 + 66) |= 0x40u;
  [v16 _setFirstItem:a3 attribute:a4];
  [v16 _setRelation:a5];
  if (a6 && a8 != 0.0)
  {
    [v16 _setMultiplier:a8];
    [v16 _setSecondItem:a6 attribute:a7];
  }
  [v16 setConstant:a9];
  ConstraintDidPerformInitialSetup((uint64_t)v16);
  return v16;
}

- (id)_viewForAutoresizingMask
{
  id v3 = [(NSLayoutConstraint *)self firstItem];
  id v4 = [(NSLayoutConstraint *)self secondItem];
  if (v4)
  {
    v5 = v4;
    if ((id)objc_msgSend(v3, "nsli_superitem") != v4) {
      return v5;
    }
  }
  return v3;
}

- (id)descriptionAccessory
{
  char v2 = objc_msgSend(-[NSAutoresizingMaskLayoutConstraint _viewForAutoresizingMask](self, "_viewForAutoresizingMask"), "nsli_autoresizingMask");
  uint64_t v3 = 38;
  if ((v2 & 0x20) != 0) {
    uint64_t v4 = 38;
  }
  else {
    uint64_t v4 = 45;
  }
  if ((v2 & 0x10) != 0) {
    uint64_t v5 = 38;
  }
  else {
    uint64_t v5 = 45;
  }
  uint64_t v11 = v5;
  uint64_t v12 = v4;
  if ((v2 & 8) != 0) {
    uint64_t v6 = 38;
  }
  else {
    uint64_t v6 = 45;
  }
  if ((v2 & 4) != 0) {
    uint64_t v7 = 38;
  }
  else {
    uint64_t v7 = 45;
  }
  uint64_t v10 = v6;
  if ((v2 & 2) != 0) {
    uint64_t v8 = 38;
  }
  else {
    uint64_t v8 = 45;
  }
  if ((v2 & 1) == 0) {
    uint64_t v3 = 45;
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"h=%c%c%c v=%c%c%c", v3, v8, v7, v10, v11, v12);
}

- (int)_constraintType
{
  if (self)
  {
    char v2 = self;
    uint64_t v3 = *(unsigned int *)((char *)&self->super._layoutConstraintFlags + 2);
    if ((v3 & 4) == 0
      || (self = (NSAutoresizingMaskLayoutConstraint *)(v3 << 40 >> 56), (int)(v3 << 8) >> 24 == -1))
    {
      id v4 = [(NSLayoutConstraint *)v2 firstItem];
      unsigned int v5 = [(NSLayoutConstraint *)v2 firstAttribute];
      id v6 = [(NSLayoutConstraint *)v2 secondItem];
      unsigned int v7 = [(NSLayoutConstraint *)v2 secondAttribute];
      if (v4 && !v6)
      {
        LODWORD(self) = 9;
        if (v5 <= 0x25 && ((1 << v5) & 0x3C001D5FD5) != 0) {
          LODWORD(self) = dword_1A64B94D8[v5];
        }
        goto LABEL_18;
      }
      LODWORD(self) = 0;
      if (!v4 || !v6)
      {
LABEL_18:
        int v9 = *(_DWORD *)((char *)&v2->super._layoutConstraintFlags + 2);
        uint64_t v8 = (char *)&v2->super._layoutConstraintFlags + 2;
        *((_WORD *)v8 + 2) = *((_WORD *)v8 + 2);
        *(_DWORD *)uint64_t v8 = v9 & 0xFF00FFFF | (self << 16) | 4;
        return (int)self;
      }
      if (v5 <= 0x25 && ((1 << v5) & 0x3F001FFE7FLL) != 0)
      {
        if (((0x3C001D5FD5uLL >> v5) & 1) != 0
          || v7 < 0x26 && ((0x3F001FFE7FuLL >> v7) & 1) != 0
          || (id)objc_msgSend(v4, "nsli_superitem") != v6)
        {
LABEL_17:
          LODWORD(self) = 0;
          goto LABEL_18;
        }
        [(NSLayoutConstraint *)v2 constant];
        BOOL v11 = v10 == 0.0;
        int v12 = 13;
        int v13 = 11;
      }
      else
      {
        if (v7 > 0x23 || ((1 << v7) & 0xF001ABFABLL) == 0)
        {
          if (v4 == (id)objc_msgSend(v6, "nsli_superitem")) {
            LODWORD(self) = 10;
          }
          else {
            LODWORD(self) = 0;
          }
          goto LABEL_18;
        }
        if (((0xF001FFE7FuLL >> v7) & 1) != 0 || (id)objc_msgSend(v4, "nsli_superitem") != v6) {
          goto LABEL_17;
        }
        [(NSLayoutConstraint *)v2 constant];
        BOOL v11 = v14 == 0.0;
        int v12 = 14;
        int v13 = 12;
      }
      if (v11) {
        LODWORD(self) = v12;
      }
      else {
        LODWORD(self) = v13;
      }
      goto LABEL_18;
    }
  }
  return (int)self;
}

@end