@interface CNContact(DNDContactHandle)
+ (id)dnds_predicateForContactsMatchingEventSender:()DNDContactHandle;
@end

@implementation CNContact(DNDContactHandle)

+ (id)dnds_predicateForContactsMatchingEventSender:()DNDContactHandle
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 contactIdentifier];

  if (v5)
  {
    v6 = [v4 contactIdentifier];
    v11[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    uint64_t v8 = [a1 predicateForContactsWithIdentifiers:v7];
LABEL_6:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  v6 = [v4 value];
  if (([v6 destinationIdIsPhoneNumber] & 1) != 0 || objc_msgSend(v4, "type") == 2)
  {
    v7 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v6];
    uint64_t v8 = [a1 predicateForContactsMatchingPhoneNumber:v7 prefixHint:0];
    goto LABEL_6;
  }
  if (v6)
  {
    v9 = [a1 predicateForContactsMatchingEmailAddress:v6];
  }
  else
  {
    v9 = 0;
  }
LABEL_7:

  return v9;
}

@end