@interface HAP2TLVCharacteristicPropertiesWrapper
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAP2TLVCharacteristicPropertiesWrapper)init;
- (HAP2TLVCharacteristicPropertiesWrapper)initWithValue:(unint64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (unint64_t)value;
- (void)setValue:(unint64_t)a3;
@end

@implementation HAP2TLVCharacteristicPropertiesWrapper

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

- (unint64_t)value
{
  return self->_value;
}

- (NSString)description
{
  v2 = NSString;
  unint64_t v3 = [(HAP2TLVCharacteristicPropertiesWrapper *)self value];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v3) {
    goto LABEL_28;
  }
  uint64_t v5 = 1;
  unint64_t v6 = v3;
  do
  {
    if ((v5 & v3) == 0) {
      goto LABEL_25;
    }
    if (v5 > 63)
    {
      if (v5 <= 255)
      {
        if (v5 == 64)
        {
          v7 = @"HAP2TLVCharacteristicPropertyHidden";
        }
        else
        {
          if (v5 != 128) {
            goto LABEL_25;
          }
          v7 = @"HAP2TLVCharacteristicPropertyNotifiesWhileConnected";
        }
      }
      else
      {
        switch(v5)
        {
          case 256:
            v7 = @"HAP2TLVCharacteristicPropertyNotifiesWhileDisconnected";
            break;
          case 512:
            v7 = @"HAP2TLVCharacteristicPropertySupportsBroadcastNotify";
            break;
          case 1024:
            v7 = @"HAP2TLVCharacteristicPropertySupportsEventNotificationContext";
            break;
          default:
            goto LABEL_25;
        }
      }
    }
    else
    {
      v7 = @"HAP2TLVCharacteristicPropertyRead";
      switch(v5)
      {
        case 1:
          break;
        case 2:
          v7 = @"HAP2TLVCharacteristicPropertyWrite";
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_25;
        case 4:
          v7 = @"HAP2TLVCharacteristicPropertyAdditionalAuthorizationData";
          break;
        case 8:
          v7 = @"HAP2TLVCharacteristicPropertyRequiresTimedWrite";
          break;
        default:
          if (v5 == 16)
          {
            v7 = @"HAP2TLVCharacteristicPropertySupportsSecureRead";
          }
          else
          {
            if (v5 != 32) {
              goto LABEL_25;
            }
            v7 = @"HAP2TLVCharacteristicPropertySupportsSecureWrite";
          }
          break;
      }
    }
    v6 &= ~v5;
    [v4 addObject:v7];
LABEL_25:
    v5 *= 2;
  }
  while (v5 - 1 < v3);
  if (v6)
  {
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown options %lu", v6);
    [v4 addObject:v8];
  }
LABEL_28:
  if ([v4 count])
  {
    v9 = [v4 componentsJoinedByString:@", "];
  }
  else
  {
    v9 = @"None";
  }

  v10 = [v2 stringWithFormat:@"<HAP2TLVCharacteristicPropertiesWrapper value=%@>", v9];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HAP2TLVCharacteristicPropertiesWrapper *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(HAP2TLVCharacteristicPropertiesWrapper *)self value];
      uint64_t v7 = [(HAP2TLVCharacteristicPropertiesWrapper *)v5 value];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HAP2TLVCharacteristicPropertiesWrapper allocWithZone:a3];
  unint64_t v5 = [(HAP2TLVCharacteristicPropertiesWrapper *)self value];

  return [(HAP2TLVCharacteristicPropertiesWrapper *)v4 initWithValue:v5];
}

- (id)serializeWithError:(id *)a3
{
  unint64_t v3 = [(HAP2TLVCharacteristicPropertiesWrapper *)self value];

  return HAPTLVWriteUInt64(v3);
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4)
  {
    *a4 = 0;
    if (![v6 length])
    {
      BOOL v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];
LABEL_10:
      BOOL v12 = 0;
      *a4 = v8;
      goto LABEL_15;
    }
  }
  else if (![v6 length])
  {
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_15;
  }
  id v9 = v7;
  v10 = (unsigned __int8 *)[v9 bytes];
  switch([v9 length])
  {
    case 1:
      uint64_t v11 = *v10;
      break;
    case 2:
      uint64_t v11 = *(unsigned __int16 *)v10;
      break;
    case 4:
      uint64_t v11 = *(unsigned int *)v10;
      break;
    case 8:
      uint64_t v11 = *(void *)v10;
      break;
    default:
      if (!a4) {
        goto LABEL_11;
      }
      BOOL v8 = HMErrorFromOSStatus(4294960553);
      goto LABEL_10;
  }
  [(HAP2TLVCharacteristicPropertiesWrapper *)self setValue:v11];
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (HAP2TLVCharacteristicPropertiesWrapper)initWithValue:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HAP2TLVCharacteristicPropertiesWrapper;
  result = [(HAP2TLVCharacteristicPropertiesWrapper *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (HAP2TLVCharacteristicPropertiesWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVCharacteristicPropertiesWrapper;
  result = [(HAP2TLVCharacteristicPropertiesWrapper *)&v3 init];
  if (result) {
    result->_value = 0;
  }
  return result;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAP2TLVCharacteristicPropertiesWrapper);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAP2TLVCharacteristicPropertiesWrapper *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      uint64_t v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

@end