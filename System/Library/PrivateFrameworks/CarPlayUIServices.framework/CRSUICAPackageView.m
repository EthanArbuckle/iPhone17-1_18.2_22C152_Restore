@interface CRSUICAPackageView
- (BOOL)setState:(id)a3 animated:(BOOL)a4;
- (CAPackage)package;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CRSUICAPackageView)initWithPackage:(id)a3;
- (CRSUICAPackageView)initWithPackage:(id)a3 dynamicStateProvider:(id)a4;
- (CRSUICAPackageView)initWithPackage:(id)a3 state:(id)a4;
- (CRSUICAPackageView)initWithPackage:(id)a3 state:(id)a4 dynamicStateProvider:(id)a5;
- (NSString)state;
- (void)layoutSubviews;
- (void)setState:(id)a3;
- (void)userInterfaceStyleChanged;
@end

@implementation CRSUICAPackageView

- (CRSUICAPackageView)initWithPackage:(id)a3
{
  return [(CRSUICAPackageView *)self initWithPackage:a3 state:0 dynamicStateProvider:0];
}

- (CRSUICAPackageView)initWithPackage:(id)a3 dynamicStateProvider:(id)a4
{
  return [(CRSUICAPackageView *)self initWithPackage:a3 state:0 dynamicStateProvider:a4];
}

- (CRSUICAPackageView)initWithPackage:(id)a3 state:(id)a4
{
  return [(CRSUICAPackageView *)self initWithPackage:a3 state:a4 dynamicStateProvider:0];
}

- (CRSUICAPackageView)initWithPackage:(id)a3 state:(id)a4 dynamicStateProvider:(id)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = [v8 rootLayer];
  if (!v11) {
    -[CRSUICAPackageView initWithPackage:state:dynamicStateProvider:]();
  }
  v12 = v11;
  [v11 frame];
  v30.receiver = self;
  v30.super_class = (Class)CRSUICAPackageView;
  v13 = -[CRSUICAPackageView initWithFrame:](&v30, sel_initWithFrame_);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_rootLayer, v12);
    id v15 = objc_alloc(MEMORY[0x263F158B0]);
    v16 = [v8 rootLayer];
    uint64_t v17 = [v15 initWithLayer:v16];
    stateController = v14->_stateController;
    v14->_stateController = (CAStateController *)v17;

    [v12 frame];
    v14->_packageSize.width = v19;
    v14->_packageSize.height = v20;
    uint64_t v21 = MEMORY[0x21D464300](v10);
    id dynamicStateProvider = v14->_dynamicStateProvider;
    v14->_id dynamicStateProvider = (id)v21;

    v23 = [v8 rootLayer];
    objc_msgSend(v23, "setGeometryFlipped:", objc_msgSend(v8, "isGeometryFlipped"));

    v24 = [(CRSUICAPackageView *)v14 layer];
    [v24 addSublayer:v12];

    if (!v9 && v10)
    {
      v25 = [(CRSUICAPackageView *)v14 traitCollection];
      v10[2](v10, v25);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v9) {
      [(CRSUICAPackageView *)v14 setState:v9 animated:0];
    }
    if (v10)
    {
      v26 = self;
      v31[0] = v26;
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
      id v28 = (id)[(CRSUICAPackageView *)v14 registerForTraitChanges:v27 withAction:sel_userInterfaceStyleChanged];
    }
  }

  return v14;
}

- (void)setState:(id)a3
{
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(CALayer *)self->_rootLayer stateWithName:v6];
  if (v7)
  {
    id v8 = (NSString *)[v6 copy];
    state = self->_state;
    self->_state = v8;

    stateController = self->_stateController;
    rootLayer = self->_rootLayer;
    if (v4)
    {
      LODWORD(v10) = 1.0;
      [(CAStateController *)stateController setState:v7 ofLayer:rootLayer transitionSpeed:v10];
    }
    else
    {
      [(CAStateController *)stateController setState:v7 ofLayer:rootLayer];
    }
  }

  return v7 != 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_packageSize.width;
  double height = self->_packageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CRSUICAPackageView;
  [(CRSUICAPackageView *)&v11 layoutSubviews];
  [(CRSUICAPackageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  if ([(CRSUICAPackageView *)self contentMode])
  {
    if ([(CRSUICAPackageView *)self contentMode] == 1)
    {
      if (v4 / self->_packageSize.width >= v6 / self->_packageSize.height) {
        double v7 = v6 / self->_packageSize.height;
      }
      else {
        double v7 = v4 / self->_packageSize.width;
      }
LABEL_11:
      double v8 = v7;
      goto LABEL_12;
    }
    double v7 = 1.0;
    double v8 = 1.0;
    if ([(CRSUICAPackageView *)self contentMode] == 2)
    {
      if (v4 / self->_packageSize.width >= v6 / self->_packageSize.height) {
        double v7 = v4 / self->_packageSize.width;
      }
      else {
        double v7 = v6 / self->_packageSize.height;
      }
      goto LABEL_11;
    }
  }
  else
  {
    double v8 = v4 / self->_packageSize.width;
    double v7 = v6 / self->_packageSize.height;
  }
LABEL_12:
  -[CALayer setPosition:](self->_rootLayer, "setPosition:", v4 * 0.5, v6 * 0.5);
  rootLayer = self->_rootLayer;
  CATransform3DMakeScale(&v10, v8, v7, 1.0);
  [(CALayer *)rootLayer setTransform:&v10];
}

- (void)userInterfaceStyleChanged
{
  id dynamicStateProvider = (void (**)(id, id))self->_dynamicStateProvider;
  if (dynamicStateProvider)
  {
    id v5 = [(CRSUICAPackageView *)self traitCollection];
    double v4 = dynamicStateProvider[2](dynamicStateProvider, v5);
    [(CRSUICAPackageView *)self setState:v4 animated:0];
  }
}

- (CAPackage)package
{
  return self->_package;
}

- (NSString)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong(&self->_dynamicStateProvider, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
}

- (void)initWithPackage:state:dynamicStateProvider:.cold.1()
{
}

@end