@interface DEDDataTask
- (BOOL)isFinished;
- (DEDDataTask)initWithDataTask:(id)a3;
- (NSData)data;
- (NSHTTPURLResponse)response;
- (NSURLSessionDataTask)dataTask;
- (id)description;
- (void)setData:(id)a3;
- (void)setDataTask:(id)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setResponse:(id)a3;
@end

@implementation DEDDataTask

- (DEDDataTask)initWithDataTask:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DEDDataTask;
  v5 = [(DEDDataTask *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(DEDDataTask *)v5 setDataTask:v4];
    [v4 resume];
  }

  return v6;
}

- (id)description
{
  v15[4] = *MEMORY[0x263EF8340];
  v14[0] = @"dataTask";
  v3 = [(DEDDataTask *)self dataTask];
  v15[0] = v3;
  v14[1] = @"data";
  id v4 = [(DEDDataTask *)self data];
  v15[1] = v4;
  v14[2] = @"response";
  v5 = [(DEDDataTask *)self response];
  v15[2] = v5;
  v14[3] = @"isFinished";
  BOOL v6 = [(DEDDataTask *)self isFinished];
  v7 = @"false";
  if (v6) {
    v7 = @"true";
  }
  v15[3] = v7;
  objc_super v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

  v9 = NSString;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v9 stringWithFormat:@"%@: %@", v11, v8];

  return v12;
}

- (NSURLSessionDataTask)dataTask
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataTask:(id)a3
{
}

- (NSHTTPURLResponse)response
{
  return (NSHTTPURLResponse *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResponse:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
}

@end