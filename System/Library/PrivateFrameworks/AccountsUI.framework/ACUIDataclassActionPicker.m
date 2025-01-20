@interface ACUIDataclassActionPicker
- (ACAccount)affectedAccount;
- (ACDataclassAction)firstDestructiveAction;
- (ACUIDataclassActionPicker)initWithActions:(id)a3 affectingAccount:(id)a4;
- (BOOL)hasActionOfType:(int64_t)a3;
- (BOOL)hasDestructiveActions;
- (NSArray)actions;
- (NSArray)affectedDataclasses;
- (id)_stringForMessage:(id)a3 withAccountType:(id)a4 dataclassDescription:(id)a5;
- (id)actionOfType:(int64_t)a3;
- (id)descriptionForDataclassAction:(id)a3;
- (id)message;
- (id)showInViewController:(id)a3;
- (id)title;
- (int64_t)priorityIndex;
- (void)addAffectedDataclass:(id)a3;
- (void)setAffectedDataclasses:(id)a3;
@end

@implementation ACUIDataclassActionPicker

- (ACUIDataclassActionPicker)initWithActions:(id)a3 affectingAccount:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)ACUIDataclassActionPicker;
  v13 = [(ACUIDataclassActionPicker *)&v10 init];
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)&v13->_affectedAccount, v11);
    v5 = (NSArray *)(id)[location[0] sortedArrayUsingComparator:&__block_literal_global_2];
    actions = v13->_actions;
    v13->_actions = v5;
  }
  v8 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

uint64_t __62__ACUIDataclassActionPicker_initWithActions_affectingAccount___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  v7[1] = a1;
  v7[0] = location[0];
  id v6 = v8;
  if ([v7[0] type])
  {
    if ([v6 type])
    {
      if (([v7[0] isDestructive] & 1) != 0 || (objc_msgSend(v6, "isDestructive") & 1) != 1) {
        uint64_t v10 = ([v7[0] isDestructive] & 1) == 1 && (objc_msgSend(v6, "isDestructive") & 1) == 0;
      }
      else {
        uint64_t v10 = -1;
      }
    }
    else
    {
      uint64_t v10 = -1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)addAffectedDataclass:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v6->_affectedDataclasses)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    affectedDataclasses = v6->_affectedDataclasses;
    v6->_affectedDataclasses = v3;
  }
  if (location[0]) {
    [(NSMutableArray *)v6->_affectedDataclasses addObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)hasDestructiveActions
{
  v2 = [(ACUIDataclassActionPicker *)self firstDestructiveAction];
  BOOL v4 = v2 != 0;

  return v4;
}

- (ACDataclassAction)firstDestructiveAction
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14 = self;
  SEL v13 = a2;
  memset(__b, 0, sizeof(__b));
  obj = [(ACUIDataclassActionPicker *)v14 actions];
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v6);
      if (([v12 isDestructive] & 1) == 1) {
        break;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          goto LABEL_9;
        }
      }
    }
    id v15 = v12;
    int v10 = 1;
  }
  else
  {
LABEL_9:
    int v10 = 0;
  }

  if (!v10) {
    id v15 = 0;
  }
  v2 = v15;
  return (ACDataclassAction *)v2;
}

- (id)actionOfType:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = self;
  SEL v16 = a2;
  int64_t v15 = a3;
  memset(__b, 0, sizeof(__b));
  obj = [(ACUIDataclassActionPicker *)v17 actions];
  uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v8);
      uint64_t v3 = [v14 type];
      if (v3 == v15) {
        break;
      }
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v9) {
          goto LABEL_9;
        }
      }
    }
    id v18 = v14;
    int v12 = 1;
  }
  else
  {
LABEL_9:
    int v12 = 0;
  }

  if (!v12) {
    id v18 = 0;
  }
  uint64_t v4 = v18;
  return v4;
}

- (BOOL)hasActionOfType:(int64_t)a3
{
  id v3 = [(ACUIDataclassActionPicker *)self actionOfType:a3];
  BOOL v5 = v3 != 0;

  return v5;
}

- (int64_t)priorityIndex
{
  uint64_t v3 = 10 * [(ACUIDataclassActionPicker *)self hasDestructiveActions];
  uint64_t v4 = [(ACUIDataclassActionPicker *)self actions];
  int64_t v5 = v3 - [(NSArray *)v4 count];

  return v5;
}

- (id)showInViewController:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  memset(__b, 0, sizeof(__b));
  obj = [(ACUIDataclassActionPicker *)v38 actions];
  uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v41 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v35 = *(void *)(__b[1] + 8 * v10);
      id v7 = v36;
      id v6 = [(ACUIDataclassActionPicker *)v38 descriptionForDataclassAction:v35];
      objc_msgSend(v7, "addObject:");

      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v41 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v33 = dispatch_semaphore_create(0);
  uint64_t v26 = 0;
  v27 = &v26;
  int v28 = 838860800;
  int v29 = 48;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  queue = MEMORY[0x1E4F14428];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  int v18 = -1073741824;
  int v19 = 0;
  uint64_t v20 = __50__ACUIDataclassActionPicker_showInViewController___block_invoke;
  v21 = &unk_1E6D1FF30;
  v25[1] = &v26;
  v22 = v38;
  id v23 = v33;
  id v24 = location[0];
  v25[0] = v36;
  dispatch_async(queue, &v17);

  os_log_t oslog = (os_log_t)_ACUILogSystem();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v40, (uint64_t)"-[ACUIDataclassActionPicker showInViewController:]", 117);
    _os_log_debug_impl(&dword_1DDFE5000, oslog, type, "%s (%d) \"ACUIDataclassActionPicker waiting on semaphore until confirmation view completes.\"", v40, 0x12u);
  }
  objc_storeStrong((id *)&oslog, 0);
  dispatch_semaphore_wait((dispatch_semaphore_t)v33, 0xFFFFFFFFFFFFFFFFLL);
  os_log_t v14 = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v39, (uint64_t)"-[ACUIDataclassActionPicker showInViewController:]", 120, v27[5]);
    _os_log_debug_impl(&dword_1DDFE5000, v14, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUIDataclassActionPicker completed with action %{public}@\"", v39, 0x1Cu);
  }
  objc_storeStrong((id *)&v14, 0);
  id v4 = (id)v27[5];
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong((id *)&v22, 0);
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v4;
}

void __50__ACUIDataclassActionPicker_showInViewController___block_invoke(uint64_t a1)
{
  v14[2] = (id)a1;
  v14[1] = (id)a1;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __50__ACUIDataclassActionPicker_showInViewController___block_invoke_2;
  unint64_t v11 = &unk_1E6D1FF08;
  v13[1] = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 32);
  v13[0] = *(id *)(a1 + 40);
  v14[0] = (id)MEMORY[0x1E01CBE70]();
  id v4 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = (id)[*(id *)(a1 + 32) title];
  id v5 = (id)[*(id *)(a1 + 32) message];
  char v1 = [*(id *)(a1 + 32) hasDestructiveActions];
  [v4 showConfirmationWithButtons:v3 title:v6 message:v5 destructive:v1 & 1 completion:v14[0]];

  objc_storeStrong(v14, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
}

intptr_t __50__ACUIDataclassActionPicker_showInViewController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = a1;
  uint64_t v10 = a2;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    id v7 = (id)[NSNumber numberWithInteger:v10];
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v12, (uint64_t)"-[ACUIDataclassActionPicker showInViewController:]_block_invoke_2", 105, (uint64_t)v7);
    _os_log_debug_impl(&dword_1DDFE5000, oslog[0], OS_LOG_TYPE_DEBUG, "%s (%d) \"Confirmation view reports completion with %{public}@\"", v12, 0x1Cu);
  }
  objc_storeStrong((id *)oslog, 0);
  id v6 = (id)[*(id *)(a1 + 32) actions];
  id v2 = (id)[v6 objectAtIndexedSubscript:v10];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)title
{
  int v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  id v23 = [(ACUIDataclassActionPicker *)self affectedDataclasses];
  BOOL v24 = [(NSArray *)v23 count] != 1;

  if (v24)
  {
    id v12 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = (id)[v12 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v9 = location[0];
    location[0] = v8;
  }
  else
  {
    v22 = [(ACUIDataclassActionPicker *)v28 affectedDataclasses];
    id v26 = [(NSArray *)v22 lastObject];

    id v25 = +[ACUILocalization localizedTitleForDataclass:v26];
    if ([(ACUIDataclassActionPicker *)v28 hasActionOfType:4]
      || [(ACUIDataclassActionPicker *)v28 hasActionOfType:5]
      || [(ACUIDataclassActionPicker *)v28 hasActionOfType:6])
    {
      int v19 = NSString;
      id v21 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v20 = (id)[v21 localizedStringForKey:@"ENABLE_OTA_WITH_EXISTING_DATA_WARNING_FORMAT_TITLE" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v2 = (id)[v19 stringWithFormat:v25];
      id v3 = location[0];
      location[0] = v2;
    }
    else if ([(ACUIDataclassActionPicker *)v28 hasActionOfType:3] {
           || [(ACUIDataclassActionPicker *)v28 hasActionOfType:2])
    }
    {
      if ([(ACUIDataclassActionPicker *)v28 hasActionOfType:3]
        && ([v26 isEqualToString:*MEMORY[0x1E4F17B38]] & 1) != 0)
      {
        objc_storeStrong(location, 0);
      }
      else
      {
        SEL v16 = NSString;
        id v18 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v17 = (id)[v18 localizedStringForKey:@"DISABLE_DATACLASS_TITLE" value:&stru_1F39EF5C0 table:@"Localizable"];
        id v4 = (id)[v16 stringWithFormat:v25];
        id v5 = location[0];
        location[0] = v4;
      }
    }
    else if ([(ACUIDataclassActionPicker *)v28 hasActionOfType:8] {
           && ([v26 isEqualToString:*MEMORY[0x1E4F17B38]] & 1) != 0)
    }
    {
      uint64_t v13 = NSString;
      id v15 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v14 = (id)[v15 localizedStringForKey:@"CLOUD_DRIVE_LOSE_NON_UPLOADED_DATA_TITLE" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v6 = (id)objc_msgSend(v13, "stringWithFormat:");
      id v7 = location[0];
      location[0] = v6;
    }
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  id v11 = location[0];
  objc_storeStrong(location, 0);
  return v11;
}

- (id)message
{
  v94 = self;
  v93[1] = (id)a2;
  v93[0] = 0;
  v86 = [(ACUIDataclassActionPicker *)self affectedDataclasses];
  v85 = [(ACUIDataclassActionPicker *)v94 affectedAccount];
  id v92 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v86, 0);

  v88 = [(ACUIDataclassActionPicker *)v94 affectedAccount];
  v87 = [(ACAccount *)v88 accountType];
  id v91 = [(ACAccountType *)v87 accountTypeDescription];

  if (![v92 length])
  {
    id v84 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v2 = (id)[v84 localizedStringForKey:@"DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v3 = v92;
    id v92 = v2;
  }
  v82 = [(ACUIDataclassActionPicker *)v94 affectedDataclasses];
  BOOL v83 = [(NSArray *)v82 count] != 1;

  if (v83)
  {
    if ([(ACUIDataclassActionPicker *)v94 hasActionOfType:2])
    {
      id v29 = [(ACUIDataclassActionPicker *)v94 _stringForMessage:@"DELETE_ACCOUNT_MERGE_WARNING" withAccountType:v91 dataclassDescription:v92];
      id v30 = v93[0];
      v93[0] = v29;
    }
    else
    {
      v37 = NSString;
      id v39 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v38 = (id)[v39 localizedStringForKey:@"DELETE_ACCOUNT_WARNING_FORMAT" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v31 = (id)[v37 stringWithFormat:v92];
      id v32 = v93[0];
      v93[0] = v31;
    }
  }
  else
  {
    id v90 = [(ACUIDataclassActionPicker *)v94 actionOfType:8];
    if (v90)
    {
      v80 = [(ACUIDataclassActionPicker *)v94 affectedDataclasses];
      id v79 = [(NSArray *)v80 firstObject];
      char v81 = [v79 isEqualToString:*MEMORY[0x1E4F17B38]];

      if (v81)
      {
        v76 = NSString;
        id v78 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v77 = (id)[v78 localizedStringForKey:@"CLOUD_DRIVE_LOSE_NON_UPLOADED_DATA_MESSAGE" value:&stru_1F39EF5C0 table:@"Localizable"];
        id v4 = (id)objc_msgSend(v76, "stringWithFormat:");
        id v5 = v93[0];
        v93[0] = v4;
      }
      else
      {
        id location = (id)[v90 affectedContainers];
        uint64_t v6 = [location count];
        if (v6)
        {
          uint64_t v8 = v6;
          char v7 = 1;
        }
        else
        {
          uint64_t v8 = 0;
          char v7 = 0;
        }
        if (v7)
        {
          v51 = NSString;
          id v57 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          id v56 = (id)[v57 localizedStringForKey:@"LOSE_NON_UPLOADED_DATA_IN_MORE_THAN_THREE_APPS_WARNING" value:&stru_1F39EF5C0 table:@"Localizable"];
          id v55 = (id)[location objectAtIndexedSubscript:0];
          id v54 = (id)[location objectAtIndexedSubscript:1];
          id v53 = (id)[location objectAtIndexedSubscript:2];
          id v52 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(location, "count") - 3);
          id v17 = (id)objc_msgSend(v51, "stringWithFormat:", v56, v92, v91, v55, v54, v53, v52);
          id v18 = v93[0];
          v93[0] = v17;
        }
        else
        {
          switch(v8)
          {
            case 0:
              v73 = NSString;
              id v75 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              id v74 = (id)[v75 localizedStringForKey:@"LOSE_NON_UPLOADED_DATA_WARNING" value:&stru_1F39EF5C0 table:@"Localizable"];
              id v9 = (id)objc_msgSend(v73, "stringWithFormat:", v92, v91);
              id v10 = v93[0];
              v93[0] = v9;

              break;
            case 1:
              v69 = NSString;
              id v72 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              id v71 = (id)[v72 localizedStringForKey:@"LOSE_NON_UPLOADED_DATA_IN_ONE_APP_WARNING" value:&stru_1F39EF5C0 table:@"Localizable"];
              id v70 = (id)[location objectAtIndexedSubscript:0];
              id v11 = (id)objc_msgSend(v69, "stringWithFormat:", v71, v92, v91, v70);
              id v12 = v93[0];
              v93[0] = v11;

              break;
            case 2:
              v64 = NSString;
              id v68 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              id v67 = (id)[v68 localizedStringForKey:@"LOSE_NON_UPLOADED_DATA_IN_TWO_APPS_WARNING" value:&stru_1F39EF5C0 table:@"Localizable"];
              id v66 = (id)[location objectAtIndexedSubscript:0];
              id v65 = (id)[location objectAtIndexedSubscript:1];
              id v13 = (id)objc_msgSend(v64, "stringWithFormat:", v67, v92, v91, v66, v65);
              id v14 = v93[0];
              v93[0] = v13;

              break;
            case 3:
              v58 = NSString;
              id v63 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              id v62 = (id)[v63 localizedStringForKey:@"LOSE_NON_UPLOADED_DATA_IN_THREE_APPS_WARNING" value:&stru_1F39EF5C0 table:@"Localizable"];
              id v61 = (id)[location objectAtIndexedSubscript:0];
              id v60 = (id)[location objectAtIndexedSubscript:1];
              id v59 = (id)[location objectAtIndexedSubscript:2];
              id v15 = (id)objc_msgSend(v58, "stringWithFormat:", v62, v92, v91, v61, v60, v59);
              id v16 = v93[0];
              v93[0] = v15;

              break;
            default:
              JUMPOUT(0);
          }
        }
        objc_storeStrong(&location, 0);
      }
    }
    else if ([(ACUIDataclassActionPicker *)v94 hasActionOfType:4] {
           || [(ACUIDataclassActionPicker *)v94 hasActionOfType:5]
    }
           || [(ACUIDataclassActionPicker *)v94 hasActionOfType:6])
    {
      v48 = NSString;
      id v50 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v49 = (id)[v50 localizedStringForKey:@"ENABLE_OTA_WITH_EXISTING_DATA_WARNING_FORMAT" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v19 = (id)[v48 stringWithFormat:v92];
      id v20 = v93[0];
      v93[0] = v19;
    }
    else if ([(ACUIDataclassActionPicker *)v94 hasActionOfType:3] {
           && [(ACUIDataclassActionPicker *)v94 hasActionOfType:2])
    }
    {
      id v21 = [(ACUIDataclassActionPicker *)v94 _stringForMessage:@"DISABLE_OTA_WITH_MERGE_OPTION_WARNING" withAccountType:v91 dataclassDescription:v92];
      id v22 = v93[0];
      v93[0] = v21;
    }
    else if ([(ACUIDataclassActionPicker *)v94 hasActionOfType:3])
    {
      v46 = [(ACUIDataclassActionPicker *)v94 affectedDataclasses];
      id v45 = [(NSArray *)v46 firstObject];
      char v47 = [v45 isEqualToString:*MEMORY[0x1E4F17B28]];

      if (v47)
      {
        id v44 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v23 = (id)[v44 localizedStringForKey:@"SIRI_DELETE_EXISTING_DATA_WARNING" value:&stru_1F39EF5C0 table:@"Localizable"];
        id v24 = v93[0];
        v93[0] = v23;
      }
      else
      {
        uint64_t v42 = [(ACUIDataclassActionPicker *)v94 affectedDataclasses];
        id v41 = [(NSArray *)v42 firstObject];
        char v43 = [v41 isEqualToString:*MEMORY[0x1E4F17B38]];

        if (v43)
        {
          id v40 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          id v25 = (id)[v40 localizedStringForKey:@"DISABLE_ICLOUD_DRIVE_WARNING" value:&stru_1F39EF5C0 table:@"Localizable"];
          id v26 = v93[0];
          v93[0] = v25;
        }
        else
        {
          id v27 = [(ACUIDataclassActionPicker *)v94 _stringForMessage:@"DELETE_EXISTING_DATA_WARNING" withAccountType:v91 dataclassDescription:v92];
          id v28 = v93[0];
          v93[0] = v27;
        }
      }
    }
    objc_storeStrong(&v90, 0);
  }
  if (!v93[0])
  {
    id v33 = (id)[NSString stringWithFormat:@"What would you like to do with %@?", v92];
    id v34 = v93[0];
    v93[0] = v33;
  }
  id v36 = v93[0];
  objc_storeStrong(&v91, 0);
  objc_storeStrong(&v92, 0);
  objc_storeStrong(v93, 0);
  return v36;
}

- (id)_stringForMessage:(id)a3 withAccountType:(id)a4 dataclassDescription:(id)a5
{
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v29 = 0;
  objc_storeStrong(&v29, a5);
  id v28 = 0;
  id v27 = (id)[MEMORY[0x1E4F28E78] string];
  [v27 appendString:location[0]];
  id v19 = [(ACUIDataclassActionPicker *)v32 affectedAccount];
  id v20 = [(ACAccount *)v19 accountType];
  id v21 = [(ACAccountType *)v20 identifier];
  char v25 = 0;
  char v23 = 0;
  char v22 = 0;
  if ([(NSString *)v21 isEqualToString:*MEMORY[0x1E4F17750]])
  {
    id v26 = [(ACUIDataclassActionPicker *)v32 affectedDataclasses];
    char v25 = 1;
    id v24 = [(NSArray *)v26 firstObject];
    char v23 = 1;
    char v22 = [v24 isEqualToString:*MEMORY[0x1E4F17B38]];
  }
  if (v23) {

  }
  if (v25) {
  if ((v22 & 1) == 0 && v30)
  }
  {
    [v27 appendString:@"_FORMAT"];
    id v11 = NSString;
    id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v12 = (id)[v13 localizedStringForKey:v27 value:&stru_1F39EF5C0 table:@"Localizable"];
    id v7 = (id)objc_msgSend(v11, "stringWithFormat:", v30, v29);
    id v8 = v28;
    id v28 = v7;
  }
  else
  {
    [v27 appendString:@"_NO_ACCOUNT_TYPE_FORMAT"];
    id v14 = NSString;
    id v16 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v15 = (id)[v16 localizedStringForKey:v27 value:&stru_1F39EF5C0 table:@"Localizable"];
    id v5 = (id)[v14 stringWithFormat:v29];
    id v6 = v28;
    id v28 = v5;
  }
  id v10 = v28;
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)descriptionForDataclassAction:(id)a3
{
  id v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] type])
  {
    if ([location[0] type] == 3)
    {
      id v18 = [(ACUIDataclassActionPicker *)v34 affectedDataclasses];
      char v31 = 0;
      char v29 = 0;
      char v19 = 0;
      if ([(NSArray *)v18 count] == 1)
      {
        id v32 = [(ACUIDataclassActionPicker *)v34 affectedDataclasses];
        char v31 = 1;
        id v30 = [(NSArray *)v32 firstObject];
        char v29 = 1;
        char v19 = [v30 isEqualToString:*MEMORY[0x1E4F17B28]];
      }
      if (v29) {

      }
      if (v31) {
      if (v19)
      }
      {
        id v17 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v35 = (__CFString *)(id)[v17 localizedStringForKey:@"SIRI_DELETE_EXISTING_DATA_ACTION_LABEL" value:&stru_1F39EF5C0 table:@"Localizable"];
      }
      else
      {
        id v15 = [(ACUIDataclassActionPicker *)v34 affectedDataclasses];
        char v27 = 0;
        char v25 = 0;
        char v16 = 0;
        if ([(NSArray *)v15 count] == 1)
        {
          id v28 = [(ACUIDataclassActionPicker *)v34 affectedDataclasses];
          char v27 = 1;
          id v26 = [(NSArray *)v28 firstObject];
          char v25 = 1;
          char v16 = [v26 isEqualToString:*MEMORY[0x1E4F17B38]];
        }
        if (v25) {

        }
        if (v27) {
        if (v16)
        }
        {
          id v14 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          uint64_t v35 = (__CFString *)(id)[v14 localizedStringForKey:@"DELETE_ICLOUD_DRIVE_SYNC_DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
        }
        else
        {
          id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          uint64_t v35 = (__CFString *)(id)[v13 localizedStringForKey:@"DELETE_SYNC_DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
        }
      }
    }
    else if ([location[0] type] == 2)
    {
      id v12 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v35 = (__CFString *)(id)[v12 localizedStringForKey:@"MERGE_SYNC_DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
    }
    else if ([location[0] type] == 4)
    {
      id v11 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v35 = (__CFString *)(id)[v11 localizedStringForKey:@"KEEP_LOCAL_DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
    }
    else if ([location[0] type] == 6)
    {
      id v10 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v35 = (__CFString *)(id)[v10 localizedStringForKey:@"DELETE_LOCAL_DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
    }
    else if ([location[0] type] == 5)
    {
      id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v35 = (__CFString *)(id)[v9 localizedStringForKey:@"MERGE_LOCAL_DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
    }
    else if ([location[0] type] == 8)
    {
      id v7 = [(ACUIDataclassActionPicker *)v34 affectedDataclasses];
      char v23 = 0;
      char v21 = 0;
      char v8 = 0;
      if ([(NSArray *)v7 count] == 1)
      {
        id v24 = [(ACUIDataclassActionPicker *)v34 affectedDataclasses];
        char v23 = 1;
        id v22 = [(NSArray *)v24 firstObject];
        char v21 = 1;
        char v8 = [v22 isEqualToString:*MEMORY[0x1E4F17B38]];
      }
      if (v21) {

      }
      if (v23) {
      if (v8)
      }
      {
        id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v35 = (__CFString *)(id)[v6 localizedStringForKey:@"CLOUD_DRIVE_LOSE_NON_UPLOADED_DATA_DELETE_TITLE" value:&stru_1F39EF5C0 table:@"Localizable"];
      }
      else
      {
        id v5 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v35 = (__CFString *)(id)[v5 localizedStringForKey:@"LOSE_NON_UPLOADED_DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
      }
    }
    else
    {
      uint64_t v35 = @"Unknown Action";
    }
  }
  else
  {
    id v20 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v35 = (__CFString *)(id)[v20 localizedStringForKey:@"CANCEL" value:&stru_1F39EF5C0 table:@"Localizable"];
  }
  objc_storeStrong(location, 0);
  id v3 = v35;
  return v3;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSArray)affectedDataclasses
{
  return &self->_affectedDataclasses->super;
}

- (void)setAffectedDataclasses:(id)a3
{
}

- (ACAccount)affectedAccount
{
  return self->_affectedAccount;
}

- (void).cxx_destruct
{
}

@end