@interface EKUICommunicationUtilities
+ (id)attendeesIgnoringMe:(id)a3;
@end

@implementation EKUICommunicationUtilities

+ (id)attendeesIgnoringMe:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "Extracting all attendees except 'me.'", buf, 2u);
  }
  v7 = [v4 organizer];
  v8 = [v4 attendees];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__EKUICommunicationUtilities_attendeesIgnoringMe___block_invoke;
  v15[3] = &unk_1E60881F0;
  id v9 = v7;
  id v16 = v9;
  v10 = [v8 indexesOfObjectsPassingTest:v15];
  v11 = [v8 objectsAtIndexes:v10];
  [v5 addObjectsFromArray:v11];
  char v12 = [v4 isSelfOrganized];

  if ((v12 & 1) == 0)
  {
    v13 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_DEBUG, "Adding the 'organizer': [%@]", buf, 0xCu);
    }
    [v5 addObject:v9];
  }

  return v5;
}

uint64_t __50__EKUICommunicationUtilities_attendeesIgnoringMe___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEBUG, "Inspecting attendee: [%@]", (uint8_t *)&v11, 0xCu);
  }
  if ([v3 isCurrentUser])
  {
    id v5 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      id v12 = v3;
      v6 = "This attendee is 'me' so it will not be extracted: [%@]";
LABEL_9:
      _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v11, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  int v7 = [v3 isEqualToParticipant:*(void *)(a1 + 32)];
  id v5 = kEKUILogHandle;
  BOOL v8 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v3;
      v6 = "This attendee is the 'organizer' so it will be skipped for now: [%@]";
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  if (v8)
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEBUG, "Extracting attendee: [%@]", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v9 = 1;
LABEL_14:

  return v9;
}

@end