@interface CXSetVideoPresentationSizeCallAction
+ (BOOL)supportsSecureCoding;
- (CGSize)videoPresentationSize;
- (CXSetVideoPresentationSizeCallAction)initWithCallUUID:(id)a3 videoPresentationSize:(CGSize)a4;
- (CXSetVideoPresentationSizeCallAction)initWithCoder:(id)a3;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setVideoPresentationSize:(CGSize)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetVideoPresentationSizeCallAction

- (CXSetVideoPresentationSizeCallAction)initWithCallUUID:(id)a3 videoPresentationSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v7.receiver = self;
  v7.super_class = (Class)CXSetVideoPresentationSizeCallAction;
  result = [(CXCallAction *)&v7 initWithCallUUID:a3];
  if (result)
  {
    result->_videoPresentationSize.CGFloat width = width;
    result->_videoPresentationSize.CGFloat height = height;
  }
  return result;
}

- (id)customDescription
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetVideoPresentationSizeCallAction;
  v3 = [(CXCallAction *)&v6 customDescription];
  [(CXSetVideoPresentationSizeCallAction *)self videoPresentationSize];
  v4 = NSStringFromSize(v8);
  [v3 appendFormat:@" videoPresentationSize=%@", v4];

  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetVideoPresentationSizeCallAction;
  id v6 = a3;
  [(CXAction *)&v7 updateCopy:v6 withZone:a4];
  [(CXSetVideoPresentationSizeCallAction *)self videoPresentationSize];
  objc_msgSend(v6, "setVideoPresentationSize:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetVideoPresentationSizeCallAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CXSetVideoPresentationSizeCallAction;
  v5 = [(CXCallAction *)&v12 initWithCoder:v4];
  id v6 = v5;
  if (v5)
  {
    p_videoPresentationSize = &v5->_videoPresentationSize;
    NSSize v8 = NSStringFromSelector(sel_videoPresentationSize);
    [v4 decodeSizeForKey:v8];
    *(void *)&p_videoPresentationSize->CGFloat width = v9;
    v6->_videoPresentationSize.CGFloat height = v10;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CXSetVideoPresentationSizeCallAction;
  id v4 = a3;
  [(CXCallAction *)&v10 encodeWithCoder:v4];
  [(CXSetVideoPresentationSizeCallAction *)self videoPresentationSize];
  double v6 = v5;
  double v8 = v7;
  v9 = NSStringFromSelector(sel_videoPresentationSize);
  objc_msgSend(v4, "encodeSize:forKey:", v9, v6, v8);
}

- (CGSize)videoPresentationSize
{
  double width = self->_videoPresentationSize.width;
  double height = self->_videoPresentationSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setVideoPresentationSize:(CGSize)a3
{
  self->_videoPresentationSize = a3;
}

@end