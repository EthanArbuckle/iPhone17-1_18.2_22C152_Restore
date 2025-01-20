@interface IMSyndicationAction
+ (BOOL)supportsSecureCoding;
+ (id)dateFromNanoSeconds:(id)a3;
+ (id)nanoSecondsFromDate:(id)a3;
+ (id)unarchiveClasses;
- (BOOL)isEqual:(id)a3;
- (IMSyndicationAction)init;
- (IMSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5;
- (IMSyndicationAction)initWithCoder:(id)a3;
- (IMSyndicationAction)initWithDictionary:(id)a3;
- (NSDate)syndicationStartDate;
- (NSString)chatGUID;
- (id)_stringFromActionType:(unsigned __int8)a3;
- (id)_stringFromItemType:(unsigned __int8)a3;
- (id)copyDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)syndicatedItemType;
- (unsigned)syndicationActionType;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3;
@end

@implementation IMSyndicationAction

- (id)_stringFromActionType:(unsigned __int8)a3
{
  if ((a3 & 4) != 0)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    [v4 addObject:@"IMSyndicationActionTypeAddItem"];
  }
  else
  {
    v4 = 0;
  }
  v5 = @"IMSyndicationActionTypeRemoveItem";
  if ((a3 & 8) == 0) {
    v5 = 0;
  }
  v6 = v5;
  if ((a3 & 8) != 0)
  {
    if (!v4)
    {
      v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:@"IMSyndicationActionTypeRemoveItem"];
  }

  v7 = @"IMSyndicationActionTypeUndonateItem";
  if ((a3 & 0x10) == 0) {
    v7 = 0;
  }
  v8 = v7;
  if ((a3 & 0x10) != 0)
  {
    if (!v4)
    {
      v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:@"IMSyndicationActionTypeUndonateItem"];
  }

  v9 = @"IMSyndicationActionTypeDonateItem";
  if ((a3 & 0x20) == 0) {
    v9 = 0;
  }
  v10 = v9;
  if ((a3 & 0x20) != 0)
  {
    if (!v4)
    {
      v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:@"IMSyndicationActionTypeDonateItem"];
  }

  v11 = @"IMSyndicationActionTypeInteractedWithItem";
  if ((a3 & 0x40) == 0) {
    v11 = 0;
  }
  v12 = v11;
  if ((a3 & 0x40) != 0)
  {
    if (!v4)
    {
      v4 = [MEMORY[0x1E4F1CA48] array];
    }
    [v4 addObject:@"IMSyndicationActionTypeInteractedWithItem"];
  }

  if (v4)
  {
    v13 = [v4 componentsJoinedByString:@" | "];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_stringFromItemType:(unsigned __int8)a3
{
  if (a3 > 2u) {
    return 0;
  }
  else {
    return off_1E5A11CF0[(char)a3];
  }
}

- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(IMSyndicationAction *)self copyDictionaryRepresentation];
  if (v5)
  {
    [v4 addEntriesFromDictionary:v5];
  }
  else
  {
    v6 = IMLogHandleForCategory("IMSyndicationAction");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1A09EF9D0();
    }
  }
}

- (IMSyndicationAction)init
{
  v3 = IMLogHandleForCategory("IMSyndicationAction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1A09EFA04();
  }

  return 0;
}

+ (id)dateFromNanoSeconds:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 longLongValue])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "longLongValue"));
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)nanoSecondsFromDate:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a3, "__im_nanosecondTimeInterval"));
  }
  else
  {
    id v4 = &unk_1EF3057D8;
  }
  return v4;
}

- (id)copyDictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[IMSyndicationAction syndicationActionType](self, "syndicationActionType"));
  [v3 setObject:v4 forKeyedSubscript:@"sat2"];

  id v5 = [(IMSyndicationAction *)self chatGUID];
  [v3 setObject:v5 forKeyedSubscript:@"sacg"];

  v6 = objc_opt_class();
  v7 = [(IMSyndicationAction *)self syndicationStartDate];
  v8 = [v6 nanoSecondsFromDate:v7];
  [v3 setObject:v8 forKeyedSubscript:@"sasd"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[IMSyndicationAction syndicatedItemType](self, "syndicatedItemType"));
  [v3 setObject:v9 forKeyedSubscript:@"sait"];

  v10 = objc_msgSend(NSNumber, "numberWithShort:", -[IMSyndicationAction version](self, "version"));
  [v3 setObject:v10 forKeyedSubscript:@"savs"];

  return v3;
}

- (IMSyndicationAction)initWithDictionary:(id)a3
{
  id v4 = IMLogHandleForCategory("IMSyndicationAction");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1A09EFA38();
  }

  return 0;
}

- (IMSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IMSyndicationAction;
  v10 = [(IMSyndicationAction *)&v18 init];
  if (!v10) {
    goto LABEL_24;
  }
  if (v8 && [v8 length])
  {
    unsigned int v11 = v5 & 0xFFFFFFFB;
    if ((v5 & 4) == 0) {
      unsigned int v11 = v5;
    }
    if ((v5 & 8) != 0) {
      v11 &= ~8u;
    }
    if ((v5 & 0x10) != 0) {
      v11 &= ~0x10u;
    }
    if ((v5 & 0x20) != 0) {
      v11 &= ~0x20u;
    }
    if ((v5 & 0x40) != 0) {
      v11 &= ~0x40u;
    }
    if (v11)
    {
      v12 = IMLogHandleForCategory("IMSyndicationAction");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1A09EFAD4(v5, v12);
      }

      goto LABEL_21;
    }
    if (v9)
    {
      uint64_t v15 = [v8 copy];
      chatGUID = v10->_chatGUID;
      v10->_chatGUID = (NSString *)v15;

      v10->_syndicationActionType = v5;
      objc_storeStrong((id *)&v10->_syndicationStartDate, a4);
      v10->_version = 2;
LABEL_24:
      v14 = v10;
      goto LABEL_25;
    }
    v13 = IMLogHandleForCategory("IMSyndicationAction");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1A09EFAA0();
    }
  }
  else
  {
    v13 = IMLogHandleForCategory("IMSyndicationAction");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1A09EFA6C();
    }
  }

LABEL_21:
  v14 = 0;
LABEL_25:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMSyndicationAction)initWithCoder:(id)a3
{
  id v4 = IMLogHandleForCategory("IMSyndicationAction");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1A09EFB50();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(IMSyndicationAction *)self chatGUID];
  [v6 encodeObject:v4 forKey:@"sacg"];

  unsigned int v5 = [(IMSyndicationAction *)self syndicationStartDate];
  [v6 encodeObject:v5 forKey:@"sasd"];

  objc_msgSend(v6, "encodeInt64:forKey:", -[IMSyndicationAction syndicationActionType](self, "syndicationActionType"), @"sat2");
  objc_msgSend(v6, "encodeInt64:forKey:", -[IMSyndicationAction version](self, "version"), @"savs");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = IMLogHandleForCategory("IMSyndicationAction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1A09EFB84();
  }

  return 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)IMSyndicationAction;
  id v4 = [(IMSyndicationAction *)&v11 description];
  unsigned int v5 = [(IMSyndicationAction *)self chatGUID];
  id v6 = [(IMSyndicationAction *)self _stringFromItemType:[(IMSyndicationAction *)self syndicatedItemType]];
  v7 = [(IMSyndicationAction *)self _stringFromActionType:[(IMSyndicationAction *)self syndicationActionType]];
  id v8 = [(IMSyndicationAction *)self syndicationStartDate];
  id v9 = [v3 stringWithFormat:@"%@ chatGUID: %@, syndicatedItemType: %@, syndicationActionType: %@, syndicationStartDate: %@, version: %d", v4, v5, v6, v7, v8, -[IMSyndicationAction version](self, "version")];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IMSyndicationAction *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = [(IMSyndicationAction *)self syndicationActionType];
      if (v5 == [(IMSyndicationAction *)v4 syndicationActionType])
      {
        id v6 = [(IMSyndicationAction *)self syndicationStartDate];
        v7 = [(IMSyndicationAction *)v4 syndicationStartDate];
        id v8 = v6;
        id v9 = v7;
        v10 = v9;
        if (v8 == v9)
        {
        }
        else
        {
          LOBYTE(v11) = 0;
          v12 = v9;
          id v13 = v8;
          if (!v8 || !v9)
          {
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          int v11 = objc_msgSend(v8, "__im_isEqualToSeconds:", v9);

          if (!v11) {
            goto LABEL_19;
          }
        }
        v14 = [(IMSyndicationAction *)self chatGUID];
        uint64_t v15 = [(IMSyndicationAction *)v4 chatGUID];
        id v13 = v14;
        id v16 = v15;
        v12 = v16;
        if (v13 == v16)
        {
          LOBYTE(v11) = 1;
        }
        else
        {
          LOBYTE(v11) = 0;
          if (v13 && v16) {
            LOBYTE(v11) = [v13 isEqualToString:v16];
          }
        }

        goto LABEL_18;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_20:

  return v11;
}

+ (id)unarchiveClasses
{
  if (qword_1E94FF4E0 != -1) {
    dispatch_once(&qword_1E94FF4E0, &unk_1EF2BF360);
  }
  v2 = (void *)qword_1E94FF4D8;

  return v2;
}

- (unsigned)syndicatedItemType
{
  return 0;
}

- (unsigned)version
{
  return 2;
}

- (unsigned)syndicationActionType
{
  return self->_syndicationActionType;
}

- (NSDate)syndicationStartDate
{
  return self->_syndicationStartDate;
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatGUID, 0);

  objc_storeStrong((id *)&self->_syndicationStartDate, 0);
}

@end