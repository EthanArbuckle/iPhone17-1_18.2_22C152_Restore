@interface _WKAttachmentDisplayOptions
- (int64_t)mode;
- (void)setMode:(int64_t)a3;
@end

@implementation _WKAttachmentDisplayOptions

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

@end