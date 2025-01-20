@interface ABDeviceButtonHighlightView
- (ABDeviceButtonHighlightView)initWithFrame:(CGRect)a3;
- (uint64_t)setColor:(uint64_t)a1;
- (void)setHighlightRingVisible:(uint64_t)a1;
@end

@implementation ABDeviceButtonHighlightView

- (ABDeviceButtonHighlightView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)ABDeviceButtonHighlightView;
  v3 = -[ABDeviceButtonHighlightView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 URLForResource:@"button highlight" withExtension:@"ca"];

    uint64_t v6 = [MEMORY[0x263F15838] packageWithContentsOfURL:v5 type:*MEMORY[0x263F15EE8] options:0 error:0];
    package = v3->_package;
    v3->_package = (CAPackage *)v6;

    CATransform3DMakeScale(&v17, 1.0, -1.0, 1.0);
    v8 = [(CAPackage *)v3->_package rootLayer];
    CATransform3D v16 = v17;
    [v8 setTransform:&v16];

    id v9 = objc_alloc(MEMORY[0x263F158B0]);
    v10 = [(CAPackage *)v3->_package rootLayer];
    uint64_t v11 = [v9 initWithLayer:v10];
    stateController = v3->_stateController;
    v3->_stateController = (CAStateController *)v11;

    v13 = [(ABDeviceButtonHighlightView *)v3 layer];
    v14 = [(CAPackage *)v3->_package rootLayer];
    [v13 addSublayer:v14];
  }
  return v3;
}

- (uint64_t)setColor:(uint64_t)a1
{
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v4 = [MEMORY[0x263F1C550] clearColor];
    }
    v3 = (id *)(a1 + 432);
    if (*(void **)(a1 + 432) != v4)
    {
      id v10 = v4;
      objc_storeStrong(v3, v4);
      v5 = [*(id *)(a1 + 408) publishedObjectWithName:@"base color"];
      uint64_t v6 = [*(id *)(a1 + 408) publishedObjectWithName:@"glow"];
      v7 = [*(id *)(a1 + 408) publishedObjectWithName:@"ring-confirmation"];
      id v11 = v10;
      uint64_t v8 = [v11 CGColor];
      [v7 setBorderColor:v8];
      [v6 setContentsMultiplyColor:v8];
      [v5 setBackgroundColor:v8];

      v4 = v11;
    }
  }

  return MEMORY[0x270F9A758](v3, v4);
}

- (void)setHighlightRingVisible:(uint64_t)a1
{
  if (a1)
  {
    char v2 = a2;
    if (*(unsigned __int8 *)(a1 + 424) != a2)
    {
      *(unsigned char *)(a1 + 424) = a2;
      v4 = [*(id *)(a1 + 408) rootLayer];
      v5 = *(void **)(a1 + 416);
      id v8 = v4;
      if (v2)
      {
        uint64_t v6 = [v4 stateWithName:@"long-press-confirmation"];
        LODWORD(v7) = 1.0;
        [v5 setState:v6 ofLayer:v8 transitionSpeed:v7];
      }
      else
      {
        [v5 setState:0 ofLayer:v4 transitionSpeed:0.0];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_stateController, 0);

  objc_storeStrong((id *)&self->_package, 0);
}

@end