@interface EKJunkInvitationProtocol_Shared
+ (unint64_t)junkStatusForInvitation:(id)a3;
+ (unint64_t)junkStatusForInvitation:(id)a3 withReputationStore:(id)a4;
@end

@implementation EKJunkInvitationProtocol_Shared

+ (unint64_t)junkStatusForInvitation:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F576B0];
  id v4 = a3;
  v5 = [v3 defaultProvider];
  v6 = [v5 reputationStore];

  unint64_t v7 = [(id)objc_opt_class() junkStatusForInvitation:v4 withReputationStore:v6];
  return v7;
}

+ (unint64_t)junkStatusForInvitation:(id)a3 withReputationStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 supportsJunkReporting];
  v8 = +[EKLogSubsystem junk];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if ((v7 & 1) == 0)
  {
    if (v9) {
      +[EKJunkInvitationProtocol_Shared junkStatusForInvitation:withReputationStore:].cold.4(v8);
    }

    goto LABEL_23;
  }
  if (v9) {
    +[EKJunkInvitationProtocol_Shared junkStatusForInvitation:withReputationStore:](v8);
  }

  v10 = [v5 sendersEmail];

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F576B0];
    v12 = [v5 sendersEmail];
    char v13 = [v11 shouldPermitOrganizerEmailFromJunkChecks:v12 inReputationStore:v6];
  }
  else
  {
    uint64_t v14 = [v5 sendersPhoneNumber];

    if (!v14) {
      goto LABEL_12;
    }
    v15 = (void *)MEMORY[0x1E4F576B0];
    v12 = [v5 sendersPhoneNumber];
    char v13 = [v15 shouldPermitOrganizerPhoneNumberFromJunkChecks:v12 inReputationStore:v6];
  }
  LOBYTE(v14) = v13;

LABEL_12:
  v16 = +[EKLogSubsystem junk];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[EKJunkInvitationProtocol_Shared junkStatusForInvitation:withReputationStore:](v14, v16);
  }

  if (v14) {
    goto LABEL_23;
  }
  v17 = [v5 sendersEmail];

  if (v17)
  {
    v18 = [v5 eventStore];
    v19 = [v5 sendersEmail];
    int v20 = [v18 shouldPermitOrganizerEmailFromJunkChecks:v19];
  }
  else
  {
    v21 = [v5 sendersPhoneNumber];

    if (!v21) {
      goto LABEL_20;
    }
    v18 = [v5 eventStore];
    v19 = [v5 sendersPhoneNumber];
    int v20 = [v18 shouldPermitOrganizerPhoneNumberFromJunkChecks:v19];
  }
  LODWORD(v21) = v20;

LABEL_20:
  v22 = +[EKLogSubsystem junk];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    +[EKJunkInvitationProtocol_Shared junkStatusForInvitation:withReputationStore:]((char)v21, v22);
  }

  if (!v21)
  {
    unint64_t v23 = 3;
    goto LABEL_24;
  }
LABEL_23:
  unint64_t v23 = 2;
LABEL_24:

  return v23;
}

+ (void)junkStatusForInvitation:(char)a1 withReputationStore:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = @"not permit";
  if (a1) {
    v2 = @"permit";
  }
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_DEBUG, "(junkStatusForInvitation) our eventstore reputation check returned that we should %@ the organizer", (uint8_t *)&v3, 0xCu);
}

+ (void)junkStatusForInvitation:(char)a1 withReputationStore:(NSObject *)a2 .cold.2(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = @"not permit";
  if (a1) {
    v2 = @"permit";
  }
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_DEBUG, "(junkStatusForInvitation) our contacts reputation check returned that we should %@ the organizer", (uint8_t *)&v3, 0xCu);
}

+ (void)junkStatusForInvitation:(os_log_t)log withReputationStore:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4E47000, log, OS_LOG_TYPE_DEBUG, "(junkStatusForInvitation) junk reporting is supported on the server", v1, 2u);
}

+ (void)junkStatusForInvitation:(os_log_t)log withReputationStore:.cold.4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4E47000, log, OS_LOG_TYPE_DEBUG, "(junkStatusForInvitation) junk reporting is not supported on the server", v1, 2u);
}

@end