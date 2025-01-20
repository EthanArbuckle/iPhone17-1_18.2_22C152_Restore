@interface NSArray(CalMigrationUtilities)
- (void)enumerateCalAlarmRefsUsingBlock:()CalMigrationUtilities;
- (void)enumerateCalAttachmentRefsUsingBlock:()CalMigrationUtilities;
- (void)enumerateCalAttendeeRefsUsingBlock:()CalMigrationUtilities;
- (void)enumerateCalCalendarRefsUsingBlock:()CalMigrationUtilities;
- (void)enumerateCalEventRefsUsingBlock:()CalMigrationUtilities;
- (void)enumerateCalNotificationRefsUsingBlock:()CalMigrationUtilities;
- (void)enumerateCalResourceChangeRefsUsingBlock:()CalMigrationUtilities;
- (void)enumerateCalStoreRefsUsingBlock:()CalMigrationUtilities;
- (void)enumerateCalTaskRefsUsingBlock:()CalMigrationUtilities;
@end

@implementation NSArray(CalMigrationUtilities)

- (void)enumerateCalEventRefsUsingBlock:()CalMigrationUtilities
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__NSArray_CalMigrationUtilities__enumerateCalEventRefsUsingBlock___block_invoke;
  v6[3] = &unk_2645A44C0;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

- (void)enumerateCalTaskRefsUsingBlock:()CalMigrationUtilities
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__NSArray_CalMigrationUtilities__enumerateCalTaskRefsUsingBlock___block_invoke;
  v6[3] = &unk_2645A44C0;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

- (void)enumerateCalCalendarRefsUsingBlock:()CalMigrationUtilities
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__NSArray_CalMigrationUtilities__enumerateCalCalendarRefsUsingBlock___block_invoke;
  v6[3] = &unk_2645A44C0;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

- (void)enumerateCalStoreRefsUsingBlock:()CalMigrationUtilities
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__NSArray_CalMigrationUtilities__enumerateCalStoreRefsUsingBlock___block_invoke;
  v6[3] = &unk_2645A44C0;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

- (void)enumerateCalAttendeeRefsUsingBlock:()CalMigrationUtilities
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__NSArray_CalMigrationUtilities__enumerateCalAttendeeRefsUsingBlock___block_invoke;
  v6[3] = &unk_2645A44C0;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

- (void)enumerateCalAttachmentRefsUsingBlock:()CalMigrationUtilities
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__NSArray_CalMigrationUtilities__enumerateCalAttachmentRefsUsingBlock___block_invoke;
  v6[3] = &unk_2645A44C0;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

- (void)enumerateCalNotificationRefsUsingBlock:()CalMigrationUtilities
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__NSArray_CalMigrationUtilities__enumerateCalNotificationRefsUsingBlock___block_invoke;
  v6[3] = &unk_2645A44C0;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

- (void)enumerateCalResourceChangeRefsUsingBlock:()CalMigrationUtilities
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__NSArray_CalMigrationUtilities__enumerateCalResourceChangeRefsUsingBlock___block_invoke;
  v6[3] = &unk_2645A44C0;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

- (void)enumerateCalAlarmRefsUsingBlock:()CalMigrationUtilities
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__NSArray_CalMigrationUtilities__enumerateCalAlarmRefsUsingBlock___block_invoke;
  v6[3] = &unk_2645A44C0;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

@end