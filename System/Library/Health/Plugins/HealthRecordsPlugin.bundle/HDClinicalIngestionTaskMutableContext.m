@interface HDClinicalIngestionTaskMutableContext
- (NSString)reason;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)options;
- (void)setInputFileHandle:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setReason:(id)a3;
@end

@implementation HDClinicalIngestionTaskMutableContext

- (void)setInputFileHandle:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HDClinicalIngestionTaskContext alloc];
  unint64_t v5 = [(HDClinicalIngestionTaskMutableContext *)self options];
  v6 = [(HDClinicalIngestionTaskMutableContext *)self reason];
  v7 = [(HDClinicalIngestionTaskContext *)v4 initWithOptions:v5 reason:v6];

  objc_storeStrong(v7 + 1, self->super._inputFileHandle);
  return v7;
}

- (unint64_t)options
{
  return self->options;
}

- (void)setOptions:(unint64_t)a3
{
  self->options = a3;
}

- (NSString)reason
{
  return self->reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end