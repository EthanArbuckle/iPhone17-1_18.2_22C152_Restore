@interface IMAPAccount
+ (id)advancedSpecifiersWithOptions:(unsigned int)a3;
+ (int)advancedSpecifiersOptions;
- (id)advancedSpecifiers;
- (id)otherTopLevelSpecifiers;
@end

@implementation IMAPAccount

+ (id)advancedSpecifiersWithOptions:(unsigned int)a3
{
  if (!qword_D7348)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = (void *)qword_D7348;
    qword_D7348 = (uint64_t)v3;

    v5 = (void *)qword_D7348;
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"MAILBOX_BEHAVIORS" value:&stru_B9F70 table:@"AccountPreferences"];
    v8 = +[PSSpecifier groupSpecifierWithName:v7];
    [v5 addObject:v8];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"DRAFTS_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:"mailbox:" detail:objc_opt_class() cell:2 edit:0];

    v12 = +[NSNumber numberWithInt:5];
    v13 = +[NSDictionary dictionaryWithObjectsAndKeys:v12, @"MailboxType", kCFBooleanFalse, @"disableForManagedAccounts", 0];
    [v11 setUserInfo:v13];

    [(id)qword_D7348 addObject:v11];
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"SENT_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:0 set:0 get:"mailbox:" detail:objc_opt_class() cell:2 edit:0];

    v17 = +[NSNumber numberWithInt:4];
    v18 = +[NSDictionary dictionaryWithObjectsAndKeys:v17, @"MailboxType", kCFBooleanFalse, @"disableForManagedAccounts", 0];
    [v16 setUserInfo:v18];

    [(id)qword_D7348 addObject:v16];
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"DELETED_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:0 set:0 get:"mailbox:" detail:objc_opt_class() cell:2 edit:0];

    v22 = +[NSNumber numberWithInt:3];
    v23 = +[NSDictionary dictionaryWithObjectsAndKeys:v22, @"MailboxType", kCFBooleanFalse, @"disableForManagedAccounts", 0];
    [v21 setUserInfo:v23];

    [(id)qword_D7348 addObject:v21];
    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"ARCHIVE_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:0 set:0 get:"mailbox:" detail:objc_opt_class() cell:2 edit:0];

    v27 = +[NSNumber numberWithInt:2];
    v28 = +[NSDictionary dictionaryWithObjectsAndKeys:v27, @"MailboxType", kCFBooleanFalse, @"disableForManagedAccounts", 0];
    [v26 setUserInfo:v28];

    [(id)qword_D7348 addObject:v26];
  }
  v29 = +[NSMutableArray array];
  [v29 addObjectsFromArray:qword_D7348];
  v34.receiver = a1;
  v34.super_class = (Class)&OBJC_METACLASS___IMAPAccount;
  v30 = objc_msgSendSuper2(&v34, "advancedSpecifiersWithOptions:", a3);
  [v29 addObjectsFromArray:v30];

  return v29;
}

+ (int)advancedSpecifiersOptions
{
  return 51;
}

- (id)advancedSpecifiers
{
  v32.receiver = self;
  v32.super_class = (Class)IMAPAccount;
  v24 = [(IMAPAccount *)&v32 advancedSpecifiers];
  unsigned int v29 = [(IMAPAccount *)self deleteInPlaceForAllMailboxes];
  unsigned int v28 = [(IMAPAccount *)self mustArchiveSentMessages];
  if ((v29 | v28 ^ 1) == 1)
  {
    id v3 = [v24 mutableCopy];
    v4 = (char *)[v3 count];
    if (v4)
    {
      v5 = v4;
      unint64_t v6 = 0;
      CFStringRef v7 = &stru_B9F70;
      v30 = v3;
      do
      {
        v8 = objc_msgSend(v3, "objectAtIndex:", v6, v23);
        v9 = v8;
        if (v29)
        {
          v31 = [v8 name];
          v10 = +[NSBundle bundleForClass:objc_opt_class()];
          v11 = [v10 localizedStringForKey:@"DELETED_MESSAGES_GROUP" value:v7 table:@"AccountPreferences"];
          if ([v31 isEqualToString:v11])
          {

            if (v28) {
              goto LABEL_17;
            }
            unsigned int v12 = 1;
          }
          else
          {
            v27 = [v9 name];
            v26 = +[NSBundle bundleForClass:objc_opt_class()];
            v25 = [v26 localizedStringForKey:@"REMOVE_FROM_TRASH" value:v7 table:@"AccountPreferences"];
            if (objc_msgSend(v27, "isEqualToString:"))
            {
              unsigned int v12 = 1;
            }
            else
            {
              v23 = [v9 name];
              v13 = +[NSBundle bundleForClass:objc_opt_class()];
              CFStringRef v14 = v7;
              v15 = [v13 localizedStringForKey:@"DELETED_MAILBOX" value:v7 table:@"AccountPreferences"];
              unsigned int v12 = [v23 isEqualToString:v15];

              CFStringRef v7 = v14;
            }

            if (v28)
            {
              if (v12) {
                goto LABEL_17;
              }
              goto LABEL_15;
            }
          }
        }
        else
        {
          if (v28) {
            goto LABEL_15;
          }
          unsigned int v12 = 0;
        }
        v17 = objc_msgSend(v9, "name", v23);
        v18 = +[NSBundle bundleForClass:objc_opt_class()];
        v19 = [v18 localizedStringForKey:@"SENT_MAILBOX" value:v7 table:@"AccountPreferences"];
        unsigned int v20 = v12 | [v17 isEqualToString:v19];

        if (v20 == 1)
        {
LABEL_17:
          objc_msgSend(v30, "removeObjectAtIndex:", v6--, v23);
          v16 = v5 - 1;
          goto LABEL_18;
        }
LABEL_15:
        v16 = v5;
LABEL_18:

        ++v6;
        v5 = v16;
        BOOL v21 = v6 >= (unint64_t)v16;
        id v3 = v30;
      }
      while (!v21);
    }
  }
  else
  {
    id v3 = v24;
  }

  return v3;
}

- (id)otherTopLevelSpecifiers
{
  id v3 = +[NSMutableArray array];
  v4 = +[DADiagnosticsPSController linkSpecifier];
  if (v4)
  {
    v16[0] = kAccountDataclassContacts;
    v16[1] = kAccountDataclassCalendars;
    v16[2] = kAccountDataclassNotes;
    +[NSArray arrayWithObjects:v16 count:3];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          if (-[IMAPAccount isEnabledForDataclass:](self, "isEnabledForDataclass:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
          {

            v9 = +[PSSpecifier emptyGroupSpecifier];
            [v3 addObject:v9];

            [v3 addObject:v4];
            goto LABEL_12;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

LABEL_12:
  }

  return v3;
}

@end