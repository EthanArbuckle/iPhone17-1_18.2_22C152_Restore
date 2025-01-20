@interface NSCalendar(INJSONSerialization)
+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:;
- (__CFString)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:;
@end

@implementation NSCalendar(INJSONSerialization)

- (__CFString)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  v1 = [a1 calendarIdentifier];
  if ([v1 isEqualToString:*MEMORY[0x1E4F1C318]])
  {
    v2 = @"GREGORIAN";
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F1C2E8]])
  {
    v2 = @"BUDDHIST";
  }
  else
  {
    if (([v1 isEqualToString:*MEMORY[0x1E4F1C2F0]] & 1) == 0)
    {
      if (([v1 isEqualToString:*MEMORY[0x1E4F1C2F8]] & 1) == 0
        && ([v1 isEqualToString:*MEMORY[0x1E4F1C308]] & 1) == 0
        && ([v1 isEqualToString:*MEMORY[0x1E4F1C300]] & 1) == 0)
      {
        if ([v1 isEqualToString:*MEMORY[0x1E4F1C320]])
        {
          v2 = @"HEBREW";
          goto LABEL_14;
        }
        if (([v1 isEqualToString:*MEMORY[0x1E4F1C328]] & 1) == 0)
        {
          if ([v1 isEqualToString:*MEMORY[0x1E4F1C330]])
          {
            v2 = @"HINDU";
            goto LABEL_14;
          }
          if ([v1 isEqualToString:*MEMORY[0x1E4F1C338]])
          {
            v2 = @"ISLAMIC";
            goto LABEL_14;
          }
          if (([v1 isEqualToString:*MEMORY[0x1E4F1C340]] & 1) == 0)
          {
            if ([v1 isEqualToString:*MEMORY[0x1E4F1C358]])
            {
              v2 = @"JAPANESE";
              goto LABEL_14;
            }
            if ([v1 isEqualToString:*MEMORY[0x1E4F1C360]])
            {
              v2 = @"PERSIAN";
              goto LABEL_14;
            }
            if ([v1 isEqualToString:*MEMORY[0x1E4F1C368]])
            {
              v2 = @"REPUBLIC_OF_CHINA";
              goto LABEL_14;
            }
            if (([v1 isEqualToString:*MEMORY[0x1E4F1C348]] & 1) == 0
              && [v1 isEqualToString:*MEMORY[0x1E4F1C350]])
            {
              v2 = @"ISLAMIC_UMALQURA";
              goto LABEL_14;
            }
          }
        }
      }
      v2 = 0;
      goto LABEL_14;
    }
    v2 = @"CHINESE";
  }
LABEL_14:

  return v2;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9) {
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_28;
  }
  id v10 = v9;
  char v11 = [v10 isEqualToString:@"BUDDHIST"];
  v12 = (id *)MEMORY[0x1E4F1C2E8];
  if ((v11 & 1) == 0)
  {
    if ([v10 isEqualToString:@"CHINESE"])
    {
      v12 = (id *)MEMORY[0x1E4F1C2F0];
      goto LABEL_25;
    }
    if ([v10 isEqualToString:@"HEBREW"])
    {
      v12 = (id *)MEMORY[0x1E4F1C320];
      goto LABEL_25;
    }
    if ([v10 isEqualToString:@"HIJRI"])
    {
LABEL_9:
      v13 = 0;
LABEL_27:

      goto LABEL_29;
    }
    if ([v10 isEqualToString:@"HINDU"])
    {
      v12 = (id *)MEMORY[0x1E4F1C330];
    }
    else if ([v10 isEqualToString:@"ISLAMIC_UMALQURA"])
    {
      v12 = (id *)MEMORY[0x1E4F1C350];
    }
    else if ([v10 isEqualToString:@"ISLAMIC"])
    {
      v12 = (id *)MEMORY[0x1E4F1C338];
    }
    else if ([v10 isEqualToString:@"GREGORIAN"])
    {
      v12 = (id *)MEMORY[0x1E4F1C318];
    }
    else if ([v10 isEqualToString:@"JAPANESE"])
    {
      v12 = (id *)MEMORY[0x1E4F1C358];
    }
    else
    {
      if ([v10 isEqualToString:@"JULIAN"]) {
        goto LABEL_9;
      }
      if ([v10 isEqualToString:@"PERSIAN"])
      {
        v12 = (id *)MEMORY[0x1E4F1C360];
      }
      else if ([v10 isEqualToString:@"REPUBLIC_OF_CHINA"])
      {
        v12 = (id *)MEMORY[0x1E4F1C368];
      }
    }
  }
LABEL_25:

  id v14 = *v12;
  if (v14)
  {
    id v10 = v14;
    v13 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v14];
    goto LABEL_27;
  }
LABEL_28:
  v13 = 0;
LABEL_29:

  return v13;
}

@end