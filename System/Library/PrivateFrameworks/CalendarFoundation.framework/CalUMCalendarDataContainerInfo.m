@interface CalUMCalendarDataContainerInfo
+ (id)_calendarGroupContainer;
- (BOOL)usesDataSeparatedContainer;
- (CalUMCalendarDataContainerInfo)initWithAccount:(id)a3;
- (CalUMCalendarDataContainerInfo)initWithPersonaID:(id)a3;
- (NSString)accountID;
- (NSString)personaID;
- (NSURL)containerURL;
@end

@implementation CalUMCalendarDataContainerInfo

- (CalUMCalendarDataContainerInfo)initWithAccount:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "cal_personaIdentifier");
  v6 = [(CalUMCalendarDataContainerInfo *)self initWithPersonaID:v5];
  if (v6)
  {
    uint64_t v7 = [v4 identifier];
    accountID = v6->_accountID;
    v6->_accountID = (NSString *)v7;
  }
  return v6;
}

- (CalUMCalendarDataContainerInfo)initWithPersonaID:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CalUMCalendarDataContainerInfo;
  id v5 = [(CalUMCalendarDataContainerInfo *)&v17 init];
  if (!v5)
  {
LABEL_15:
    v10 = (CalUMCalendarDataContainerInfo *)v5;
    goto LABEL_16;
  }
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[CalPersonaUtils personalPersonaIdentifier];
  }
  uint64_t v7 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v6;

  uint64_t v8 = *((void *)v5 + 3);
  if (!v8
    || (v15[0] = MEMORY[0x1E4F143A8],
        v15[1] = 3221225472,
        v15[2] = __52__CalUMCalendarDataContainerInfo_initWithPersonaID___block_invoke,
        v15[3] = &unk_1E56CE6F0,
        id v16 = v5,
        BOOL v9 = +[CalPersonaUtils performBlockAsPersonaWithIdentifier:v8 block:v15], v16, !v4)|| v9)
  {
    if (!*((void *)v5 + 4))
    {
      if (*((void *)v5 + 3))
      {
        v11 = +[CalFoundationLogSubsystem defaultCategory];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[CalUMCalendarDataContainerInfo initWithPersonaID:]((uint64_t *)v5 + 3, v11);
        }
      }
      *((unsigned char *)v5 + 8) = 0;
      uint64_t v12 = +[CalUMCalendarDataContainerInfo _calendarGroupContainer];
      v13 = (void *)*((void *)v5 + 4);
      *((void *)v5 + 4) = v12;
    }
    goto LABEL_15;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

uint64_t __52__CalUMCalendarDataContainerInfo_initWithPersonaID___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = [a2 isDataSeparatedPersona];
  *(void *)(*(void *)(a1 + 32) + 32) = +[CalUMCalendarDataContainerInfo _calendarGroupContainer];

  return MEMORY[0x1F41817F8]();
}

+ (id)_calendarGroupContainer
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.calendar"];

  return v3;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (BOOL)usesDataSeparatedContainer
{
  return self->_usesDataSeparatedContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_personaID, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

- (void)initWithPersonaID:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Couldn't restore personal persona %@. Assuming we're already running in that persona and hoping for the best.", (uint8_t *)&v3, 0xCu);
}

@end