@interface FMAPSDelegateInfo
- (FMAPSDelegate)delegate;
- (NSString)topic;
- (void)setDelegate:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation FMAPSDelegateInfo

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (FMAPSDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FMAPSDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end