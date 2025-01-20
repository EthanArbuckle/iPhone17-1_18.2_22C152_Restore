@interface _SFKeyboardGeometry
+ (id)_keyboardGeometryForCurrentDeviceWithInterfaceOrientation:(int64_t)a3;
+ (id)keyboardGeometryForInterfaceOrientation:(int64_t)a3;
- (CGSize)sizeWithBar;
- (CGSize)sizeWithoutBar;
- (id)_initWithFallbackSizeForOrientation:(int64_t)a3;
- (id)_initWithSizeWithoutBar:(CGSize)a3 sizeWithBar:(CGSize)a4;
@end

@implementation _SFKeyboardGeometry

- (id)_initWithSizeWithoutBar:(CGSize)a3 sizeWithBar:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v6 = a3.height;
  CGFloat v7 = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)_SFKeyboardGeometry;
  v8 = [(_SFKeyboardGeometry *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_sizeWithoutBar.CGFloat width = v7;
    v8->_sizeWithoutBar.CGFloat height = v6;
    v8->_sizeWithBar.CGFloat width = width;
    v8->_sizeWithBar.CGFloat height = height;
    v10 = v8;
  }

  return v9;
}

- (id)_initWithFallbackSizeForOrientation:(int64_t)a3
{
  [MEMORY[0x1E4FB1900] defaultSizeForInterfaceOrientation:a3];

  return -[_SFKeyboardGeometry _initWithSizeWithoutBar:sizeWithBar:](self, "_initWithSizeWithoutBar:sizeWithBar:", v4, v5, v4, v5);
}

+ (id)_keyboardGeometryForCurrentDeviceWithInterfaceOrientation:(int64_t)a3
{
  double v5 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  CGFloat v6 = MEMORY[0x1AD0C2860](@"en");
  CGFloat v7 = [v6 firstObject];

  if (v7 && ([v5 inputModeWithIdentifier:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    Class v10 = NSClassFromString(&cfstr_Uikeyboardlayo.isa);
    if (v10 && (Class v11 = v10, ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()] & 1) != 0))
    {
      objc_super v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v12 _referenceBounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      CGFloat v20 = v19;
      v21 = +[SFKBScreenTraits traitsWithScreen:v12 orientation:a3];
      double Height = v18;
      double Width = v20;
      if ((unint64_t)(a3 - 1) >= 2)
      {
        v40.origin.x = v14;
        v40.origin.y = v16;
        v40.size.CGFloat width = v18;
        v40.size.CGFloat height = v20;
        double Width = CGRectGetWidth(v40);
        v41.origin.x = v14;
        v41.origin.y = v16;
        v41.size.CGFloat width = v18;
        v41.size.CGFloat height = v20;
        double Height = CGRectGetHeight(v41);
      }
      objc_msgSend(v21, "setBounds:", v14, v16, Height, Width);
      v42.origin.x = v14;
      v42.origin.y = v16;
      v42.size.CGFloat width = Height;
      v42.size.CGFloat height = Width;
      double v24 = CGRectGetWidth(v42);
      objc_msgSend(v21, "setKeyboardWidth:");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v43.origin.x = v14;
        v43.origin.y = v16;
        v43.size.CGFloat width = v18;
        v43.size.CGFloat height = v20;
        double v25 = CGRectGetWidth(v43);
        v44.origin.x = v14;
        v44.origin.y = v16;
        v44.size.CGFloat width = v18;
        v44.size.CGFloat height = v20;
        objc_msgSend(v21, "setSf_isKeyboardMinorEdgeWidth:", v24 == fmin(v25, CGRectGetHeight(v44)));
      }
      v26 = [v9 identifier];
      [(objc_class *)v11 keyboardSizeForInputMode:v26 screenTraits:v21 keyboardType:0];
      double v28 = v27;
      double v30 = v29;

      id v31 = v21;
      if ([v31 idiom] == 1)
      {

        double v32 = 55.0;
      }
      else if ((unint64_t)([v31 orientation] - 3) > 1)
      {
        [v31 bounds];
        if (v34 <= 375.0)
        {
          double v35 = v34;

          double v32 = 38.0;
          if (v35 > 320.0) {
            double v32 = 44.0;
          }
        }
        else
        {

          double v32 = 45.0;
        }
      }
      else
      {

        double v32 = 38.0;
      }
      double v36 = v30 + v32;
      if (v18 <= 320.0) {
        double v37 = v36 + -1.0;
      }
      else {
        double v37 = v36;
      }
      v33 = objc_msgSend(objc_alloc((Class)a1), "_initWithSizeWithoutBar:sizeWithBar:", v28, v30, v28, v37);
    }
    else
    {
      v33 = (void *)[objc_alloc((Class)a1) _initWithFallbackSizeForOrientation:a3];
    }
  }
  else
  {
    v33 = (void *)[objc_alloc((Class)a1) _initWithFallbackSizeForOrientation:a3];
  }

  return v33;
}

+ (id)keyboardGeometryForInterfaceOrientation:(int64_t)a3
{
  uint64_t v4 = keyboardGeometryForInterfaceOrientation__portraitKeyboardGeometry;
  uint64_t v5 = keyboardGeometryForInterfaceOrientation__landscapeKeyboardGeometry;
  if (keyboardGeometryForInterfaceOrientation__portraitKeyboardGeometry) {
    BOOL v6 = keyboardGeometryForInterfaceOrientation__landscapeKeyboardGeometry == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v8 = [a1 _keyboardGeometryForCurrentDeviceWithInterfaceOrientation:1];
    v9 = (void *)keyboardGeometryForInterfaceOrientation__portraitKeyboardGeometry;
    keyboardGeometryForInterfaceOrientation__portraitKeyboardGeometry = v8;

    uint64_t v10 = [a1 _keyboardGeometryForCurrentDeviceWithInterfaceOrientation:4];
    Class v11 = (void *)keyboardGeometryForInterfaceOrientation__landscapeKeyboardGeometry;
    keyboardGeometryForInterfaceOrientation__landscapeKeyboardGeometry = v10;

    uint64_t v4 = keyboardGeometryForInterfaceOrientation__portraitKeyboardGeometry;
    uint64_t v5 = keyboardGeometryForInterfaceOrientation__landscapeKeyboardGeometry;
  }
  if ((unint64_t)(a3 - 1) >= 2) {
    objc_super v12 = (void *)v5;
  }
  else {
    objc_super v12 = (void *)v4;
  }

  return v12;
}

- (CGSize)sizeWithoutBar
{
  double width = self->_sizeWithoutBar.width;
  double height = self->_sizeWithoutBar.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)sizeWithBar
{
  double width = self->_sizeWithBar.width;
  double height = self->_sizeWithBar.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end