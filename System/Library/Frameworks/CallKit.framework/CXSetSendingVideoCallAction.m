@interface CXSetSendingVideoCallAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isSendingVideo;
- (CXSetSendingVideoCallAction)initWithCallUUID:(id)a3 sendingVideo:(BOOL)a4;
- (CXSetSendingVideoCallAction)initWithCoder:(id)a3;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSendingVideo:(BOOL)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetSendingVideoCallAction

- (CXSetSendingVideoCallAction)initWithCallUUID:(id)a3 sendingVideo:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetSendingVideoCallAction;
  result = [(CXCallAction *)&v6 initWithCallUUID:a3];
  if (result) {
    result->_sendingVideo = a4;
  }
  return result;
}

- (id)customDescription
{
  v5.receiver = self;
  v5.super_class = (Class)CXSetSendingVideoCallAction;
  v3 = [(CXCallAction *)&v5 customDescription];
  objc_msgSend(v3, "appendFormat:", @" sendingVideo=%d", -[CXSetSendingVideoCallAction isSendingVideo](self, "isSendingVideo"));

  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetSendingVideoCallAction;
  id v6 = a3;
  [(CXAction *)&v7 updateCopy:v6 withZone:a4];
  objc_msgSend(v6, "setSendingVideo:", -[CXSetSendingVideoCallAction isSendingVideo](self, "isSendingVideo", v7.receiver, v7.super_class));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetSendingVideoCallAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetSendingVideoCallAction;
  objc_super v5 = [(CXCallAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_isSendingVideo);
    v5->_sendingVideo = [v4 decodeBoolForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetSendingVideoCallAction;
  id v4 = a3;
  [(CXCallAction *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(CXSetSendingVideoCallAction *)self isSendingVideo];
  id v6 = NSStringFromSelector(sel_isSendingVideo);
  [v4 encodeBool:v5 forKey:v6];
}

- (BOOL)isSendingVideo
{
  return self->_sendingVideo;
}

- (void)setSendingVideo:(BOOL)a3
{
  self->_sendingVideo = a3;
}

@end