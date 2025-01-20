@interface EvaluatorDownload
@end

@implementation EvaluatorDownload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end