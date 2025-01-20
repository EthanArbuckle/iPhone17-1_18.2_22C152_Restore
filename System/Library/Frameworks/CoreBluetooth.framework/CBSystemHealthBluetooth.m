@interface CBSystemHealthBluetooth
- (CBSystemHealthBluetooth)init;
- (CBSystemHealthBluetooth)initWithComponentType:(unint64_t)a3;
- (unint64_t)componentType;
- (unint64_t)getComponentStatusWithError:(id *)a3;
- (void)setComponentType:(unint64_t)a3;
@end

@implementation CBSystemHealthBluetooth

- (CBSystemHealthBluetooth)init
{
  return 0;
}

- (CBSystemHealthBluetooth)initWithComponentType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CBSystemHealthBluetooth;
  result = [(CBSystemHealthBluetooth *)&v5 init];
  if (result) {
    result->componentType = a3;
  }
  return result;
}

- (unint64_t)getComponentStatusWithError:(id *)a3
{
  v4 = +[CBController controllerInfoAndReturnError:](CBController, "controllerInfoAndReturnError:");
  objc_super v5 = [v4 lastChipsetInitError];
  v6 = v5;
  if (!v5)
  {
    unint64_t v8 = 2;
    goto LABEL_9;
  }
  if (a3) {
    *a3 = (id)[v5 copy];
  }
  int v7 = [v6 code];
  unint64_t v8 = 1;
  if (v7 > 310212)
  {
    if ((v7 - 310213) < 2) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if (v7 != 310001) {
LABEL_6:
  }
    unint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (unint64_t)componentType
{
  return self->componentType;
}

- (void)setComponentType:(unint64_t)a3
{
  self->componentType = a3;
}

@end