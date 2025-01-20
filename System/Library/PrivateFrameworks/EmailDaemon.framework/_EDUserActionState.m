@interface _EDUserActionState
- (BOOL)mutedThread;
- (BOOL)scrolledToEnd;
- (ECMessage)message;
- (NSDate)viewingStarted;
- (NSString)cellStyle;
- (NSString)key;
- (NSString)messageListType;
- (int64_t)row;
- (void)setCellStyle:(id)a3;
- (void)setKey:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageListType:(id)a3;
- (void)setMutedThread:(BOOL)a3;
- (void)setRow:(int64_t)a3;
- (void)setScrolledToEnd:(BOOL)a3;
- (void)setViewingStarted:(id)a3;
@end

@implementation _EDUserActionState

- (NSDate)viewingStarted
{
  return self->_viewingStarted;
}

- (void)setViewingStarted:(id)a3
{
}

- (ECMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (BOOL)scrolledToEnd
{
  return self->_scrolledToEnd;
}

- (void)setScrolledToEnd:(BOOL)a3
{
  self->_scrolledToEnd = a3;
}

- (BOOL)mutedThread
{
  return self->_mutedThread;
}

- (void)setMutedThread:(BOOL)a3
{
  self->_mutedThread = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(id)a3
{
}

- (NSString)messageListType
{
  return self->_messageListType;
}

- (void)setMessageListType:(id)a3
{
}

- (int64_t)row
{
  return self->_row;
}

- (void)setRow:(int64_t)a3
{
  self->_row = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListType, 0);
  objc_storeStrong((id *)&self->_cellStyle, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_viewingStarted, 0);
}

@end