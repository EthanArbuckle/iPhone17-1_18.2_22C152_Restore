@interface RequestThrottlePersistence
@end

@implementation RequestThrottlePersistence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end