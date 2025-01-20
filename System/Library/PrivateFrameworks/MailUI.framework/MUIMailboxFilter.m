@interface MUIMailboxFilter
+ (id)iconNameForMailboxType:(int64_t)a3;
- (BOOL)hasMailboxPredicate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFilter:(id)a3;
- (BOOL)isEquivalentToPredicate:(id)a3;
- (MUIMailboxFilter)initWithAccount:(id)a3 iconFromSmartMailbox:(id)a4;
- (MUIMailboxFilter)initWithType:(int64_t)a3 name:(id)a4 description:(id)a5 iconImageName:(id)a6 iconTintColor:(id)a7 predicate:(id)a8 hasMailboxPredicate:(BOOL)a9;
- (NSPredicate)predicate;
- (NSString)debugDescription;
- (NSString)filterDescription;
- (NSString)iconImageName;
- (NSString)name;
- (UIColor)iconTintColor;
- (UIImage)icon;
- (id)initForCCMeMessages;
- (id)initForFlaggedMessages;
- (id)initForMessagesWithAttachments;
- (id)initForSender:(id)a3;
- (id)initForSmartMailboxType:(int64_t)a3;
- (id)initForToMeMessages;
- (id)initForTodayMessages;
- (id)initForUnreadMessages;
- (id)initForVIPMessages;
- (int64_t)type;
- (unint64_t)hash;
- (void)setHasMailboxPredicate:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconImageName:(id)a3;
- (void)setIconTintColor:(id)a3;
- (void)setPredicate:(id)a3;
@end

@implementation MUIMailboxFilter

- (MUIMailboxFilter)initWithType:(int64_t)a3 name:(id)a4 description:(id)a5 iconImageName:(id)a6 iconTintColor:(id)a7 predicate:(id)a8 hasMailboxPredicate:(BOOL)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (!v16)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"MUIMailboxFilter.m", 91, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)MUIMailboxFilter;
  v21 = [(MUIMailboxFilter *)&v32 init];
  v22 = v21;
  if (v21)
  {
    v21->_type = a3;
    uint64_t v23 = [v16 copy];
    name = v22->_name;
    v22->_name = (NSString *)v23;

    if (v17) {
      v25 = v17;
    }
    else {
      v25 = v16;
    }
    uint64_t v26 = [v25 copy];
    filterDescription = v22->_filterDescription;
    v22->_filterDescription = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    iconImageName = v22->_iconImageName;
    v22->_iconImageName = (NSString *)v28;

    objc_storeStrong((id *)&v22->_iconTintColor, a7);
    objc_storeStrong((id *)&v22->_predicate, a8);
    v22->_hasMailboxPredicate = a9;
  }

  return v22;
}

- (BOOL)isEquivalentToPredicate:(id)a3
{
  id v4 = a3;
  v5 = [(MUIMailboxFilter *)self predicate];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(MUIMailboxFilter *)self predicate];
  uint64_t v4 = [v3 hash];

  v5 = [(MUIMailboxFilter *)self name];
  uint64_t v6 = 33 * (33 * v4 + [v5 hash]);

  v7 = [(MUIMailboxFilter *)self filterDescription];
  unint64_t v8 = v6 + [v7 hash] + 35937;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MUIMailboxFilter *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(MUIMailboxFilter *)self isEqualToFilter:v4];
  }

  return v5;
}

- (BOOL)isEqualToFilter:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(MUIMailboxFilter *)self predicate];

    if (v5)
    {
      uint64_t v6 = [(MUIMailboxFilter *)self predicate];
      int v7 = [v4 isEquivalentToPredicate:v6];
    }
    else
    {
      int v7 = 0;
    }
    v9 = [(MUIMailboxFilter *)self name];
    v10 = [v4 name];
    if ([v9 isEqualToString:v10])
    {
      v11 = [(MUIMailboxFilter *)self filterDescription];
      v12 = [v4 filterDescription];
      int v8 = [v11 isEqualToString:v12] & v7;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (NSString)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MUIMailboxFilter *)self name];
  int v7 = [(MUIMailboxFilter *)self filterDescription];
  int v8 = [(MUIMailboxFilter *)self predicate];
  v9 = [v3 stringWithFormat:@"<%@: %p\nName: %@\nDescription:  %@\nPredicate: \n%@", v5, self, v6, v7, v8];

  return (NSString *)v9;
}

- (id)initForFlaggedMessages
{
  v3 = [MEMORY[0x1E4F60390] predicateForFlaggedMessages];
  id v4 = _EFLocalizedString();
  BOOL v5 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(MUIMailboxFilter *)self initWithType:0 name:v4 description:v4 iconImageName:@"flag.fill" iconTintColor:v5 predicate:v3 hasMailboxPredicate:v8];

  return v6;
}

- (id)initForUnreadMessages
{
  v3 = [MEMORY[0x1E4F60390] predicateForUnreadMessages];
  id v4 = _EFLocalizedString();
  BOOL v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(MUIMailboxFilter *)self initWithType:1 name:v4 description:v4 iconImageName:@"envelope.badge" iconTintColor:v5 predicate:v3 hasMailboxPredicate:v8];

  return v6;
}

- (id)initForToMeMessages
{
  v3 = [MEMORY[0x1E4F60390] predicateForToMeMessages];
  id v4 = _EFLocalizedString();
  BOOL v5 = [MEMORY[0x1E4FB1618] mailTransparentLightGrayColor];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(MUIMailboxFilter *)self initWithType:2 name:v4 description:0 iconImageName:0 iconTintColor:v5 predicate:v3 hasMailboxPredicate:v8];

  return v6;
}

- (id)initForCCMeMessages
{
  v3 = [MEMORY[0x1E4F60390] predicateForCCMeMessages];
  id v4 = _EFLocalizedString();
  BOOL v5 = [MEMORY[0x1E4FB1618] mailTransparentLightGrayColor];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(MUIMailboxFilter *)self initWithType:3 name:v4 description:0 iconImageName:0 iconTintColor:v5 predicate:v3 hasMailboxPredicate:v8];

  return v6;
}

- (id)initForTodayMessages
{
  v3 = [MEMORY[0x1E4F60390] predicateForTodayMessages];
  id v4 = _EFLocalizedString();
  BOOL v5 = _EFLocalizedString();
  uint64_t v6 = [MEMORY[0x1E4FB1618] mailTodayFilterColor];
  LOBYTE(v9) = 0;
  int v7 = [(MUIMailboxFilter *)self initWithType:5 name:v4 description:v5 iconImageName:@"calendar" iconTintColor:v6 predicate:v3 hasMailboxPredicate:v9];

  return v7;
}

- (id)initForMessagesWithAttachments
{
  v3 = [MEMORY[0x1E4F60390] predicateForMessagesWithAttachments];
  id v4 = _EFLocalizedString();
  BOOL v5 = _EFLocalizedString();
  uint64_t v6 = [MEMORY[0x1E4FB1618] mailAttachmentsFilterColor];
  LOBYTE(v9) = 0;
  int v7 = [(MUIMailboxFilter *)self initWithType:6 name:v4 description:v5 iconImageName:@"paperclip" iconTintColor:v6 predicate:v3 hasMailboxPredicate:v9];

  return v7;
}

- (id)initForVIPMessages
{
  v3 = _EFLocalizedString();
  id v4 = _EFLocalizedString();
  BOOL v5 = [MEMORY[0x1E4F60390] predicateForIsVIP:1];
  uint64_t v6 = [MEMORY[0x1E4FB1618] mailVIPFilterColor];
  LOBYTE(v9) = 0;
  int v7 = [(MUIMailboxFilter *)self initWithType:8 name:v3 description:v4 iconImageName:@"star.fill" iconTintColor:v6 predicate:v5 hasMailboxPredicate:v9];

  return v7;
}

- (MUIMailboxFilter)initWithAccount:(id)a3 iconFromSmartMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F60390] predicateForAccount:v6];
  uint64_t v9 = 8;
  switch([v7 smartMailboxType])
  {
    case 0:
      goto LABEL_9;
    case 1:
      v10 = @"flag";
      uint64_t v9 = 0;
      break;
    case 2:
      uint64_t v9 = 1;
      goto LABEL_9;
    case 3:
      uint64_t v9 = 4;
      goto LABEL_9;
    case 4:
      uint64_t v9 = 6;
      goto LABEL_9;
    case 5:
      v10 = @"bell";
      uint64_t v9 = 10;
      break;
    case 6:
      uint64_t v9 = 5;
LABEL_9:
      v10 = @"tray";
      break;
    case 7:
      v10 = @"bell.slash";
      uint64_t v9 = 9;
      break;
    case 8:
      +[MUIMailboxFilter iconNameForMailboxType:](MUIMailboxFilter, "iconNameForMailboxType:", [v7 type]);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = 11;
      break;
    case 9:
      v10 = @"clock";
      uint64_t v9 = 13;
      break;
    case 10:
      v10 = @"envelope.open.badge.clock";
      uint64_t v9 = 14;
      break;
    case 11:
      v10 = @"arrow.up.circle.badge.clock";
      uint64_t v9 = 15;
      break;
    case 12:
      v10 = @"xmark";
      uint64_t v9 = 16;
      break;
    default:
      v10 = 0;
      uint64_t v9 = -1;
      break;
  }
  v11 = [v6 name];
  LOBYTE(v14) = 1;
  v12 = [(MUIMailboxFilter *)self initWithType:v9 name:v11 description:0 iconImageName:v10 iconTintColor:0 predicate:v8 hasMailboxPredicate:v14];

  return v12;
}

- (id)initForSmartMailboxType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id result = [(MUIMailboxFilter *)self initForVIPMessages];
      break;
    case 1:
      id result = [(MUIMailboxFilter *)self initForFlaggedMessages];
      break;
    case 2:
      id result = [(MUIMailboxFilter *)self initForUnreadMessages];
      break;
    case 3:
      id result = [(MUIMailboxFilter *)self initForToMeMessages];
      break;
    case 4:
      id result = [(MUIMailboxFilter *)self initForMessagesWithAttachments];
      break;
    case 6:
      id result = [(MUIMailboxFilter *)self initForTodayMessages];
      break;
    default:

      id result = 0;
      break;
  }
  return result;
}

- (id)initForSender:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MUIMailboxFilter.m", 325, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x1E4F60390];
  id v7 = [v5 senderList];
  uint64_t v8 = [v6 predicateForMessagesWithSenders:v7];

  uint64_t v9 = _EFLocalizedString();
  v10 = _EFLocalizedString();
  v11 = [MEMORY[0x1E4FB1618] mailSenderFilterColor];
  LOBYTE(v15) = 0;
  v12 = [(MUIMailboxFilter *)self initWithType:17 name:v9 description:v10 iconImageName:@"person.crop.circle" iconTintColor:v11 predicate:v8 hasMailboxPredicate:v15];

  return v12;
}

+ (id)iconNameForMailboxType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    uint64_t v3 = MFImageGlyphFilterGenericMailbox;
  }
  else {
    uint64_t v3 = off_1E6D12E70[a3 - 1];
  }
  return *v3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)filterDescription
{
  return self->_filterDescription;
}

- (NSString)iconImageName
{
  return self->_iconImageName;
}

- (void)setIconImageName:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (UIColor)iconTintColor
{
  return self->_iconTintColor;
}

- (void)setIconTintColor:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (BOOL)hasMailboxPredicate
{
  return self->_hasMailboxPredicate;
}

- (void)setHasMailboxPredicate:(BOOL)a3
{
  self->_hasMailboxPredicate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_iconTintColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconImageName, 0);
  objc_storeStrong((id *)&self->_filterDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end