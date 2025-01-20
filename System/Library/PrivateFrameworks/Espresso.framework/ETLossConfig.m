@interface ETLossConfig
+ (id)L2Loss;
+ (id)softmaxCrossEntropyLoss;
- (NSArray)label_shape;
- (NSString)custom_network_path;
- (NSString)label_name;
- (NSString)loss_name;
- (NSString)output_name;
- (unint64_t)mode;
- (void)setCustom_network_path:(id)a3;
- (void)setLabel_name:(id)a3;
- (void)setLabel_shape:(id)a3;
- (void)setLoss_name:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setOutput_name:(id)a3;
@end

@implementation ETLossConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custom_network_path, 0);
  objc_storeStrong((id *)&self->_label_shape, 0);
  objc_storeStrong((id *)&self->_label_name, 0);
  objc_storeStrong((id *)&self->_output_name, 0);

  objc_storeStrong((id *)&self->_loss_name, 0);
}

- (void)setCustom_network_path:(id)a3
{
}

- (NSString)custom_network_path
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLabel_shape:(id)a3
{
}

- (NSArray)label_shape
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLabel_name:(id)a3
{
}

- (NSString)label_name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOutput_name:(id)a3
{
}

- (NSString)output_name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLoss_name:(id)a3
{
}

- (NSString)loss_name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

+ (id)L2Loss
{
  v2 = objc_opt_new();
  [v2 setMode:2];

  return v2;
}

+ (id)softmaxCrossEntropyLoss
{
  v2 = objc_opt_new();
  [v2 setMode:1];

  return v2;
}

@end