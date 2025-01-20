@interface MLBackgroundPredictionTask
+ (BOOL)supportsSecureCoding;
+ (Class)taskRunnerClass;
- (MLBackgroundPredictionTask)initWithCoder:(id)a3;
- (MLModelConfiguration)modelConfiguration;
- (MLPredictionOptions)predictionOptions;
- (NSURL)modelURL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setModelConfiguration:(id)a3;
- (void)setModelURL:(id)a3;
- (void)setPredictionOptions:(id)a3;
@end

@implementation MLBackgroundPredictionTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionOptions, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);

  objc_storeStrong((id *)&self->_modelURL, 0);
}

- (void)setPredictionOptions:(id)a3
{
}

- (MLPredictionOptions)predictionOptions
{
  return self->_predictionOptions;
}

- (void)setModelConfiguration:(id)a3
{
}

- (MLModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (void)setModelURL:(id)a3
{
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MLBackgroundPredictionTask;
  id v4 = [(MLBackgroundTask *)&v6 copyWithZone:a3];
  [v4 setModelURL:self->_modelURL];
  [v4 setModelConfiguration:self->_modelConfiguration];
  [v4 setPredictionOptions:self->_predictionOptions];
  return v4;
}

- (MLBackgroundPredictionTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MLBackgroundPredictionTask;
  v5 = [(MLBackgroundTask *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelURL"];
    modelURL = v5->_modelURL;
    v5->_modelURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelConfiguration"];
    modelConfiguration = v5->_modelConfiguration;
    v5->_modelConfiguration = (MLModelConfiguration *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionOptions"];
    predictionOptions = v5->_predictionOptions;
    v5->_predictionOptions = (MLPredictionOptions *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MLBackgroundPredictionTask;
  id v4 = a3;
  [(MLBackgroundTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_modelURL, @"modelURL", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_modelConfiguration forKey:@"modelConfiguration"];
  [v4 encodeObject:self->_predictionOptions forKey:@"predictionOptions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)taskRunnerClass
{
  return (Class)objc_opt_class();
}

@end