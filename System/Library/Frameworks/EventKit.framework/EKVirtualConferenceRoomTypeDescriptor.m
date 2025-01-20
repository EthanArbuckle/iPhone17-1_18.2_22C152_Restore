@interface EKVirtualConferenceRoomTypeDescriptor
- (EKVirtualConferenceRoomTypeDescriptor)initWithTitle:(NSString *)title identifier:(EKVirtualConferenceRoomTypeIdentifier)identifier;
- (EKVirtualConferenceRoomTypeIdentifier)identifier;
- (NSString)title;
@end

@implementation EKVirtualConferenceRoomTypeDescriptor

- (EKVirtualConferenceRoomTypeDescriptor)initWithTitle:(NSString *)title identifier:(EKVirtualConferenceRoomTypeIdentifier)identifier
{
  v7 = title;
  v8 = identifier;
  v11.receiver = self;
  v11.super_class = (Class)EKVirtualConferenceRoomTypeDescriptor;
  v9 = [(EKVirtualConferenceRoomTypeDescriptor *)&v11 init];
  if (v9)
  {
    if (![(NSString *)v7 length]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"title is empty"];
    }
    if (![(NSString *)v8 length]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"identifier is empty"];
    }
    objc_storeStrong((id *)&v9->_title, title);
    objc_storeStrong((id *)&v9->_identifier, identifier);
  }

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (EKVirtualConferenceRoomTypeIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end