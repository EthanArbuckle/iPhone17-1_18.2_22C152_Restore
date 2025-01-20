@interface CNGeminiChannel
+ (BOOL)supportsSecureCoding;
- (BOOL)isAvailable;
- (CNGeminiChannel)initWithCoder:(id)a3;
- (NSString)channelIdentifier;
- (NSString)handle;
- (NSString)localizedBadgeLabel;
- (NSString)localizedLabel;
- (TUSenderIdentity)senderIdentity;
- (id)initWithChannelIdentifier:(void *)a3 localizedLabel:(void *)a4 localizedBadgeLabel:(void *)a5 handle:(void *)a6 senderIdentity:(char)a7 available:;
- (id)initWithDanglingPlanItem:(id *)a1;
- (id)initWithDisabledCellularPlanItem:(id *)a1;
- (id)initWithSenderIdentity:(id *)a1;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNGeminiChannel

- (id)initWithSenderIdentity:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [v3 accountUUID];
    v5 = [v4 UUIDString];
    v6 = [v3 localizedName];
    v7 = [v3 localizedShortName];
    v8 = [v3 handle];
    v9 = [v8 value];
    v10 = -[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:](v2, v5, v6, v7, v9, v3, 1);

    v2 = v10;
  }
  return v2;
}

- (id)initWithChannelIdentifier:(void *)a3 localizedLabel:(void *)a4 localizedBadgeLabel:(void *)a5 handle:(void *)a6 senderIdentity:(char)a7 available:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)CNGeminiChannel;
    a1 = (id *)objc_msgSendSuper2(&v27, sel_init);
    if (a1)
    {
      uint64_t v18 = [v13 copy];
      id v19 = a1[2];
      a1[2] = (id)v18;

      uint64_t v20 = [v14 copy];
      id v21 = a1[3];
      a1[3] = (id)v20;

      uint64_t v22 = [v15 copy];
      id v23 = a1[4];
      a1[4] = (id)v22;

      uint64_t v24 = [v16 copy];
      id v25 = a1[5];
      a1[5] = (id)v24;

      objc_storeStrong(a1 + 6, a6);
      *((unsigned char *)a1 + 8) = a7;
    }
  }

  return a1;
}

- (id)initWithDanglingPlanItem:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [v3 simLabelID];
    v5 = [v3 userLabel];
    v6 = [v5 label];
    v7 = [v3 phoneNumber];

    v2 = -[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:](v2, v4, v6, 0, v7, 0, 0);
  }
  return v2;
}

- (id)initWithDisabledCellularPlanItem:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [v3 userLabel];
    v5 = [v4 labelId];
    v6 = [v3 userLabel];
    v7 = [v6 label];
    v8 = [v3 phoneNumber];

    v2 = -[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:](v2, v5, v7, 0, v8, 0, 0);
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNGeminiChannel)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_channelIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localizedLabel"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localizedBadgeLabel"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handle"];
  v9 = [v4 decodeObjectOfClass:getTUSenderIdentityClass() forKey:@"_senderIdentity"];
  char v10 = [v4 decodeBoolForKey:@"_available"];

  v11 = (CNGeminiChannel *)-[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:]((id *)&self->super.isa, v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  channelIdentifier = self->_channelIdentifier;
  id v5 = a3;
  [v5 encodeObject:channelIdentifier forKey:@"_channelIdentifier"];
  [v5 encodeObject:self->_localizedLabel forKey:@"_localizedLabel"];
  [v5 encodeObject:self->_localizedBadgeLabel forKey:@"_localizedBadgeLabel"];
  [v5 encodeObject:self->_handle forKey:@"_handle"];
  [v5 encodeObject:self->_senderIdentity forKey:@"_senderIdentity"];
  [v5 encodeBool:self->_available forKey:@"_available"];
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (NSString)localizedBadgeLabel
{
  return self->_localizedBadgeLabel;
}

- (NSString)handle
{
  return self->_handle;
}

- (TUSenderIdentity)senderIdentity
{
  return self->_senderIdentity;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderIdentity, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_localizedBadgeLabel, 0);
  objc_storeStrong((id *)&self->_localizedLabel, 0);

  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end