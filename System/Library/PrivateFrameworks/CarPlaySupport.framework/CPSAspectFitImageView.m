@interface CPSAspectFitImageView
- (CPSAspectFitImageView)init;
- (NSLayoutConstraint)aspectConstraint;
- (void)_updateConstraints;
- (void)setAspectConstraint:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation CPSAspectFitImageView

- (CPSAspectFitImageView)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)CPSAspectFitImageView;
  v6 = [(CPSAspectFitImageView *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    [(CPSAspectFitImageView *)v6 setContentMode:1];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)setImage:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSAspectFitImageView;
  [(CPSAspectFitImageView *)&v3 setImage:location[0]];
  [(CPSAspectFitImageView *)v5 _updateConstraints];
  objc_storeStrong(location, 0);
}

- (void)_updateConstraints
{
  v35[1] = *MEMORY[0x263EF8340];
  v33 = self;
  SEL v32 = a2;
  v24 = [(CPSAspectFitImageView *)self aspectConstraint];

  if (v24)
  {
    v21 = (void *)MEMORY[0x263F08938];
    v23 = [(CPSAspectFitImageView *)v33 aspectConstraint];
    v35[0] = v23;
    id v22 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
    objc_msgSend(v21, "deactivateConstraints:");

    [(CPSAspectFitImageView *)v33 setAspectConstraint:0];
  }
  id v19 = (id)[(CPSAspectFitImageView *)v33 image];
  char v30 = 0;
  char v26 = 0;
  BOOL v20 = 0;
  if (v19)
  {
    id v31 = (id)[(CPSAspectFitImageView *)v33 image];
    char v30 = 1;
    [v31 size];
    uint64_t v28 = v3;
    double v29 = v2;
    BOOL v20 = 0;
    if (v2 > 0.0)
    {
      id v27 = (id)[(CPSAspectFitImageView *)v33 image];
      char v26 = 1;
      [v27 size];
      v25[6] = v4;
      v25[7] = v5;
      BOOL v20 = *(double *)&v4 > 0.0;
    }
  }
  if (v26) {

  }
  if (v30) {
  if (v20)
  }
  {
    id v13 = (id)[(CPSAspectFitImageView *)v33 image];
    [v13 size];
    v25[3] = v6;
    v25[4] = v7;
    double v12 = *(double *)&v6;
    id v11 = (id)[(CPSAspectFitImageView *)v33 image];
    [v11 size];
    v25[1] = v8;
    v25[2] = v9;
    double v14 = v12 / *(double *)&v9;

    v25[5] = *(id *)&v14;
    id v16 = (id)[(CPSAspectFitImageView *)v33 widthAnchor];
    id v15 = (id)[(CPSAspectFitImageView *)v33 heightAnchor];
    v25[0] = (id)objc_msgSend(v16, "constraintEqualToAnchor:multiplier:", v14);

    LODWORD(v10) = 1148846080;
    [v25[0] setPriority:v10];
    v17 = (void *)MEMORY[0x263F08938];
    id v34 = v25[0];
    id v18 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
    objc_msgSend(v17, "activateConstraints:");

    [(CPSAspectFitImageView *)v33 setAspectConstraint:v25[0]];
    objc_storeStrong(v25, 0);
  }
}

- (NSLayoutConstraint)aspectConstraint
{
  return self->_aspectConstraint;
}

- (void)setAspectConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end