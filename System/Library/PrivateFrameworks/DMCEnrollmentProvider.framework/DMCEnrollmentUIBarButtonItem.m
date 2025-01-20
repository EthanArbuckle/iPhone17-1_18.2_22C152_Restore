@interface DMCEnrollmentUIBarButtonItem
- (DMCEnrollmentUIBarButtonItem)initWithType:(unint64_t)a3 target:(id)a4 action:(SEL)a5;
- (unint64_t)type;
@end

@implementation DMCEnrollmentUIBarButtonItem

- (DMCEnrollmentUIBarButtonItem)initWithType:(unint64_t)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  switch(a3)
  {
    case 0uLL:

      self = 0;
      goto LABEL_10;
    case 1uLL:
      v9 = DMCLocalizedString();
      v10 = self;
      v11 = v9;
      uint64_t v12 = 0;
      goto LABEL_6;
    case 2uLL:
    case 4uLL:
      v9 = DMCLocalizedString();
      v10 = self;
      v11 = v9;
      uint64_t v12 = 2;
LABEL_6:
      v13 = [(DMCEnrollmentUIBarButtonItem *)v10 initWithTitle:v11 style:v12 target:v8 action:a5];
      goto LABEL_7;
    case 3uLL:
      v9 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
      [v9 startAnimating];
      v13 = [(DMCEnrollmentUIBarButtonItem *)self initWithCustomView:v9];
LABEL_7:
      self = v13;

      break;
    default:
      break;
  }
  if (self) {
    self->_type = a3;
  }
LABEL_10:

  return self;
}

- (unint64_t)type
{
  return self->_type;
}

@end