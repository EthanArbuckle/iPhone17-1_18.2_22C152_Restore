@interface CXSetMutedCallAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isBottomUpMute;
- (BOOL)isMuted;
- (CXSetMutedCallAction)initWithCallUUID:(NSUUID *)callUUID muted:(BOOL)muted;
- (CXSetMutedCallAction)initWithCallUUID:(id)a3 muted:(BOOL)a4 bottomUpMute:(BOOL)a5;
- (CXSetMutedCallAction)initWithCoder:(NSCoder *)aDecoder;
- (id)customDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setBottomUpMute:(BOOL)a3;
- (void)setMuted:(BOOL)muted;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetMutedCallAction

- (CXSetMutedCallAction)initWithCallUUID:(NSUUID *)callUUID muted:(BOOL)muted
{
  return [(CXSetMutedCallAction *)self initWithCallUUID:callUUID muted:muted bottomUpMute:0];
}

- (CXSetMutedCallAction)initWithCallUUID:(id)a3 muted:(BOOL)a4 bottomUpMute:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CXSetMutedCallAction;
  result = [(CXCallAction *)&v8 initWithCallUUID:a3];
  if (result)
  {
    result->_muted = a4;
    result->_bottomUpMute = a5;
  }
  return result;
}

- (id)customDescription
{
  v5.receiver = self;
  v5.super_class = (Class)CXSetMutedCallAction;
  v3 = [(CXCallAction *)&v5 customDescription];
  objc_msgSend(v3, "appendFormat:", @" muted=%d", -[CXSetMutedCallAction isMuted](self, "isMuted"));
  objc_msgSend(v3, "appendFormat:", @" bottomUp=%d", -[CXSetMutedCallAction isBottomUpMute](self, "isBottomUpMute"));

  return v3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetMutedCallAction;
  id v6 = a3;
  [(CXCallAction *)&v7 updateSanitizedCopy:v6 withZone:a4];
  objc_msgSend(v6, "setMuted:", -[CXSetMutedCallAction isMuted](self, "isMuted", v7.receiver, v7.super_class));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetMutedCallAction)initWithCoder:(NSCoder *)aDecoder
{
  v4 = aDecoder;
  v8.receiver = self;
  v8.super_class = (Class)CXSetMutedCallAction;
  objc_super v5 = [(CXCallAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_isMuted);
    v5->_muted = [(NSCoder *)v4 decodeBoolForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetMutedCallAction;
  id v4 = a3;
  [(CXCallAction *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(CXSetMutedCallAction *)self isMuted];
  id v6 = NSStringFromSelector(sel_isMuted);
  [v4 encodeBool:v5 forKey:v6];
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)muted
{
  self->_muted = muted;
}

- (BOOL)isBottomUpMute
{
  return self->_bottomUpMute;
}

- (void)setBottomUpMute:(BOOL)a3
{
  self->_bottomUpMute = a3;
}

@end