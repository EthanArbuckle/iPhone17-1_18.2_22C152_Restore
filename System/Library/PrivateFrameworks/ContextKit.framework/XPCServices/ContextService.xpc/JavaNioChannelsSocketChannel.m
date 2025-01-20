@interface JavaNioChannelsSocketChannel
+ (const)__metadata;
+ (id)open;
+ (id)openWithJavaNetSocketAddress:(id)a3;
- (BOOL)connectWithJavaNetSocketAddress:(id)a3;
- (BOOL)finishConnect;
- (BOOL)isConnected;
- (BOOL)isConnectionPending;
- (JavaNioChannelsSocketChannel)initWithJavaNioChannelsSpiSelectorProvider:(id)a3;
- (id)bindWithJavaNetSocketAddress:(id)a3;
- (id)getLocalAddress;
- (id)getOptionWithJavaNetSocketOption:(id)a3;
- (id)setOptionWithJavaNetSocketOption:(id)a3 withId:(id)a4;
- (id)socket;
- (id)supportedOptions;
- (int)readWithJavaNioByteBuffer:(id)a3;
- (int)validOps;
- (int)writeWithJavaNioByteBuffer:(id)a3;
- (int64_t)readWithJavaNioByteBufferArray:(id)a3;
- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)writeWithJavaNioByteBufferArray:(id)a3;
- (int64_t)writeWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaNioChannelsSocketChannel

- (JavaNioChannelsSocketChannel)initWithJavaNioChannelsSpiSelectorProvider:(id)a3
{
  return self;
}

+ (id)open
{
  v2 = (void *)JavaNioChannelsSpiSelectorProvider_provider();
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 openSocketChannel];
}

+ (id)openWithJavaNetSocketAddress:(id)a3
{
  v4 = (void *)JavaNioChannelsSpiSelectorProvider_provider();
  if (!v4) {
    JreThrowNullPointerException();
  }
  id v5 = [v4 openSocketChannel];
  v6 = v5;
  if (v5) {
    [v5 connectWithJavaNetSocketAddress:a3];
  }
  return v6;
}

- (int)validOps
{
  return 13;
}

- (id)socket
{
  return 0;
}

- (id)bindWithJavaNetSocketAddress:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"Subclasses must override this method");
  objc_exception_throw(v3);
}

- (id)getLocalAddress
{
  v2 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"Subclasses must override this method");
  objc_exception_throw(v2);
}

- (id)getOptionWithJavaNetSocketOption:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"Subclasses must override this method");
  objc_exception_throw(v3);
}

- (id)setOptionWithJavaNetSocketOption:(id)a3 withId:(id)a4
{
  v4 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"Subclasses must override this method");
  objc_exception_throw(v4);
}

- (id)supportedOptions
{
  v2 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"Subclasses must override this method");
  objc_exception_throw(v2);
}

- (BOOL)isConnected
{
  return 0;
}

- (BOOL)isConnectionPending
{
  return 0;
}

- (BOOL)connectWithJavaNetSocketAddress:(id)a3
{
  return 0;
}

- (BOOL)finishConnect
{
  return 0;
}

- (int)readWithJavaNioByteBuffer:(id)a3
{
  return 0;
}

- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return 0;
}

- (int64_t)readWithJavaNioByteBufferArray:(id)a3
{
  objc_sync_enter(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  int64_t v5 = [(JavaNioChannelsSocketChannel *)self readWithJavaNioByteBufferArray:a3 withInt:0 withInt:*((unsigned int *)a3 + 2)];
  objc_sync_exit(self);
  return v5;
}

- (int)writeWithJavaNioByteBuffer:(id)a3
{
  return 0;
}

- (int64_t)writeWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return 0;
}

- (int64_t)writeWithJavaNioByteBufferArray:(id)a3
{
  objc_sync_enter(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  int64_t v5 = [(JavaNioChannelsSocketChannel *)self writeWithJavaNioByteBufferArray:a3 withInt:0 withInt:*((unsigned int *)a3 + 2)];
  objc_sync_exit(self);
  return v5;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100467470;
}

@end