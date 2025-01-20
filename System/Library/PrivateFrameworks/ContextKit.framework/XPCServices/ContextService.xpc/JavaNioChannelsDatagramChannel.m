@interface JavaNioChannelsDatagramChannel
+ (const)__metadata;
+ (id)open;
- (BOOL)isConnected;
- (JavaNioChannelsDatagramChannel)initWithJavaNioChannelsSpiSelectorProvider:(id)a3;
- (id)bindWithJavaNetSocketAddress:(id)a3;
- (id)connectWithJavaNetSocketAddress:(id)a3;
- (id)disconnect;
- (id)getLocalAddress;
- (id)getOptionWithJavaNetSocketOption:(id)a3;
- (id)receiveWithJavaNioByteBuffer:(id)a3;
- (id)setOptionWithJavaNetSocketOption:(id)a3 withId:(id)a4;
- (id)socket;
- (id)supportedOptions;
- (int)readWithJavaNioByteBuffer:(id)a3;
- (int)sendWithJavaNioByteBuffer:(id)a3 withJavaNetSocketAddress:(id)a4;
- (int)validOps;
- (int)writeWithJavaNioByteBuffer:(id)a3;
- (int64_t)readWithJavaNioByteBufferArray:(id)a3;
- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)writeWithJavaNioByteBufferArray:(id)a3;
- (int64_t)writeWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaNioChannelsDatagramChannel

- (JavaNioChannelsDatagramChannel)initWithJavaNioChannelsSpiSelectorProvider:(id)a3
{
  return self;
}

+ (id)open
{
  v2 = (void *)JavaNioChannelsSpiSelectorProvider_provider();
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 openDatagramChannel];
}

- (int)validOps
{
  return 5;
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

- (id)connectWithJavaNetSocketAddress:(id)a3
{
  return 0;
}

- (id)disconnect
{
  return 0;
}

- (id)receiveWithJavaNioByteBuffer:(id)a3
{
  return 0;
}

- (int)sendWithJavaNioByteBuffer:(id)a3 withJavaNetSocketAddress:(id)a4
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
  int64_t v5 = [(JavaNioChannelsDatagramChannel *)self readWithJavaNioByteBufferArray:a3 withInt:0 withInt:*((unsigned int *)a3 + 2)];
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
  int64_t v5 = [(JavaNioChannelsDatagramChannel *)self writeWithJavaNioByteBufferArray:a3 withInt:0 withInt:*((unsigned int *)a3 + 2)];
  objc_sync_exit(self);
  return v5;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F61D8;
}

@end