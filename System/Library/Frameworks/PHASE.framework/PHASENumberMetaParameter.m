@interface PHASENumberMetaParameter
+ (PHASENumberMetaParameter)new;
- (PHASENumberMetaParameter)init;
- (PHASENumberMetaParameter)initWithUID:(id)a3 delegate:(id)a4;
- (PHASENumberMetaParameter)initWithUID:(id)a3 value:(double)a4 rangeMin:(double)a5 rangeMax:(double)a6 delegate:(id)a7;
- (double)maximum;
- (double)minimum;
- (void)fadeToValue:(double)value duration:(NSTimeInterval)duration;
@end

@implementation PHASENumberMetaParameter

- (PHASENumberMetaParameter)init
{
  return 0;
}

+ (PHASENumberMetaParameter)new
{
  return 0;
}

- (PHASENumberMetaParameter)initWithUID:(id)a3 delegate:(id)a4
{
  return 0;
}

- (PHASENumberMetaParameter)initWithUID:(id)a3 value:(double)a4 rangeMin:(double)a5 rangeMax:(double)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PHASENumberMetaParameter;
  v14 = [(PHASEMetaParameter *)&v19 initWithUID:v12 delegate:v13];
  v15 = v14;
  if (v14)
  {
    v14->_minimum = a5;
    v14->_maximum = a6;
    v16 = [NSNumber numberWithDouble:a4];
    [(PHASEMetaParameter *)v15 setValue:v16];

    v17 = v15;
  }

  return v15;
}

- (void)fadeToValue:(double)value duration:(NSTimeInterval)duration
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHASEMetaParameter setLocalValueOnly:](self, "setLocalValueOnly:");

  id v9 = [(PHASEMetaParameter *)self delegate];
  v7 = [(PHASEMetaParameter *)self identifier];
  [v9 setMetaParameter:v7 value:value withTimeInterval:duration];
}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

@end