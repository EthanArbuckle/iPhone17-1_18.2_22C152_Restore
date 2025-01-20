@interface JavaNioChannelsServerSocketChannel
+ (const)__metadata;
+ (id)open;
- (JavaNioChannelsServerSocketChannel)initWithJavaNioChannelsSpiSelectorProvider:(id)a3;
- (id)accept;
- (id)bindWithJavaNetSocketAddress:(id)a3;
- (id)bindWithJavaNetSocketAddress:(id)a3 withInt:(int)a4;
- (id)getLocalAddress;
- (id)getOptionWithJavaNetSocketOption:(id)a3;
- (id)setOptionWithJavaNetSocketOption:(id)a3 withId:(id)a4;
- (id)socket;
- (id)supportedOptions;
- (int)validOps;
@end

@implementation JavaNioChannelsServerSocketChannel

- (JavaNioChannelsServerSocketChannel)initWithJavaNioChannelsSpiSelectorProvider:(id)a3
{
  return self;
}

+ (id)open
{
  v2 = (void *)JavaNioChannelsSpiSelectorProvider_provider();
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 openServerSocketChannel];
}

- (int)validOps
{
  return 16;
}

- (id)socket
{
  return 0;
}

- (id)bindWithJavaNetSocketAddress:(id)a3
{
  return [(JavaNioChannelsServerSocketChannel *)self bindWithJavaNetSocketAddress:a3 withInt:0];
}

- (id)bindWithJavaNetSocketAddress:(id)a3 withInt:(int)a4
{
  v4 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"Subclasses must override this method");
  objc_exception_throw(v4);
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

- (id)accept
{
  return 0;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100472720;
}

@end