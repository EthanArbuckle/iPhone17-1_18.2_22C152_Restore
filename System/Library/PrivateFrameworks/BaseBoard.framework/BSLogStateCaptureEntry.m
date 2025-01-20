@interface BSLogStateCaptureEntry
- (NSString)title;
- (OS_dispatch_queue)queue;
- (id)captureBlock;
@end

@implementation BSLogStateCaptureEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_captureBlock, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)title
{
  return self->_title;
}

- (id)captureBlock
{
  return self->_captureBlock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end