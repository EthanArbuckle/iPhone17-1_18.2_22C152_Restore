@interface AKToolbarViewController
+ (id)_imageNameForToolbarButtonItemOfType:(unint64_t)a3;
+ (id)alternateImageForToolbarButtonItemOfType:(unint64_t)a3;
+ (id)imageForToolbarButtonItemOfType:(unint64_t)a3;
+ (id)titleForToolbarButtonItemOfType:(unint64_t)a3;
+ (int64_t)buttonTypeForToolbarButtonItemOfType:(unint64_t)a3;
- (AKController)controller;
- (AKToolbarViewController)initWithController:(id)a3;
- (BOOL)isPresentingPopover;
- (id)_toolbarButtonItemOfType:(unint64_t)a3;
- (void)setController:(id)a3;
@end

@implementation AKToolbarViewController

- (AKToolbarViewController)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKToolbarViewController;
  v5 = [(AKToolbarViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AKToolbarViewController *)v5 setController:v4];
  }

  return v6;
}

- (BOOL)isPresentingPopover
{
  return 0;
}

- (id)_toolbarButtonItemOfType:(unint64_t)a3
{
  return 0;
}

+ (id)titleForToolbarButtonItemOfType:(unint64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 0uLL:
      id v4 = +[AKController akBundle];
      v5 = v4;
      v6 = @"Sketch";
      goto LABEL_10;
    case 1uLL:
      id v4 = +[AKController akBundle];
      v5 = v4;
      v6 = @"Draw";
      goto LABEL_10;
    case 3uLL:
      id v4 = +[AKController akBundle];
      v5 = v4;
      v6 = @"Sign";
      goto LABEL_10;
    case 4uLL:
      id v4 = +[AKController akBundle];
      v5 = v4;
      v6 = @"Text";
      goto LABEL_10;
    case 0xDuLL:
      id v4 = +[AKController akBundle];
      v5 = v4;
      v6 = @"Draw_Ink";
      v7 = @"Draw";
      goto LABEL_11;
    case 0x11uLL:
    case 0x13uLL:
      id v4 = +[AKController akBundle];
      v5 = v4;
      v6 = @"Rotate Left";
      goto LABEL_10;
    case 0x12uLL:
      id v4 = +[AKController akBundle];
      v5 = v4;
      v6 = @"Rotate Right";
      goto LABEL_10;
    case 0x14uLL:
      id v4 = +[AKController akBundle];
      v5 = v4;
      v6 = @"Crop";
LABEL_10:
      v7 = &stru_26EA57918;
LABEL_11:
      v3 = [v4 localizedStringForKey:v6 value:v7 table:@"AKToolbarViewController"];

      break;
    default:
      break;
  }

  return v3;
}

+ (id)_imageNameForToolbarButtonItemOfType:(unint64_t)a3
{
  if (a3 > 0x14) {
    return 0;
  }
  else {
    return off_264CDBB20[a3];
  }
}

+ (id)imageForToolbarButtonItemOfType:(unint64_t)a3
{
  v3 = [a1 _imageNameForToolbarButtonItemOfType:a3];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F1C6B0];
    v5 = +[AKController akBundle];
    v6 = [v4 imageNamed:v3 inBundle:v5 compatibleWithTraitCollection:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)alternateImageForToolbarButtonItemOfType:(unint64_t)a3
{
  v3 = [a1 _imageNameForToolbarButtonItemOfType:a3];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 stringByAppendingString:@"_Active"];

    v6 = (void *)MEMORY[0x263F1C6B0];
    v7 = +[AKController akBundle];
    id v4 = [v6 imageNamed:v5 inBundle:v7 compatibleWithTraitCollection:0];
  }
  else
  {
    v5 = 0;
  }

  return v4;
}

+ (int64_t)buttonTypeForToolbarButtonItemOfType:(unint64_t)a3
{
  return 1;
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end