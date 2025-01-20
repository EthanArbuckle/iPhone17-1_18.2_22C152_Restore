@interface BLTPingHandlerHolder
- (BLTPingHandlerHolder)init;
- (BLTPingHandlerHolder)initWithPingHandler:(id)a3;
- (BOOL)canAck;
- (BOOL)canAckOnLocalConnection;
- (BOOL)forBulletin;
- (BOOL)forNotification;
- (NSString)sectionID;
- (unint64_t)ackType;
- (void)_performPingWithAckableForwardBlock:(id)a3 ackableNoParametersBlock:(id)a4 noAckBlock:(id)a5 clientAck:(id)a6;
- (void)pingWithBulletin:(id)a3 ack:(id)a4;
- (void)pingWithBulletin:(id)a3 notification:(id)a4 ack:(id)a5;
- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5;
- (void)setAckType:(unint64_t)a3;
- (void)setForBulletin:(BOOL)a3;
- (void)setForNotification:(BOOL)a3;
- (void)setSectionID:(id)a3;
@end

@implementation BLTPingHandlerHolder

- (void)setSectionID:(id)a3
{
}

- (void)setForNotification:(BOOL)a3
{
  self->_forNotification = a3;
}

- (void)setForBulletin:(BOOL)a3
{
  self->_forBulletin = a3;
}

- (void)setAckType:(unint64_t)a3
{
  self->_ackType = a3;
}

- (BLTPingHandlerHolder)initWithPingHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)BLTPingHandlerHolder;
    v5 = [(BLTPingHandlerHolder *)&v9 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      id pingHandler = v5->_pingHandler;
      v5->_id pingHandler = (id)v6;
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (BOOL)canAck
{
  return self->_ackType != 0;
}

- (BOOL)canAckOnLocalConnection
{
  return self->_ackType == 3;
}

- (BLTPingHandlerHolder)init
{
  return [(BLTPingHandlerHolder *)self initWithPingHandler:0];
}

- (void)_performPingWithAckableForwardBlock:(id)a3 ackableNoParametersBlock:(id)a4 noAckBlock:(id)a5 clientAck:(id)a6
{
  v15 = (void (**)(void))a3;
  v10 = (void (**)(void))a4;
  v11 = (void (**)(void))a5;
  v12 = (void (**)(id, uint64_t))a6;
  if (![(BLTPingHandlerHolder *)self canAck])
  {
    v14 = v11;
    if (v12)
    {
      v12[2](v12, 1);
      v14 = v11;
    }
    goto LABEL_7;
  }
  unint64_t ackType = self->_ackType;
  v14 = v15;
  if (ackType - 2 < 2 || (v14 = v10, ackType == 1)) {
LABEL_7:
  }
    v14[2]();
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke;
  v21[3] = &unk_264683EA0;
  v21[4] = self;
  id v22 = v9;
  id v23 = v8;
  id v24 = v10;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2;
  v17[3] = &unk_264683EA0;
  v17[4] = self;
  id v18 = v22;
  id v19 = v23;
  id v20 = v24;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_3;
  v14[3] = &unk_264683E78;
  v14[4] = self;
  id v15 = v18;
  id v16 = v19;
  id v11 = v19;
  id v12 = v18;
  id v13 = v24;
  [(BLTPingHandlerHolder *)self _performPingWithAckableForwardBlock:v21 ackableNoParametersBlock:v17 noAckBlock:v14 clientAck:v13];
}

void __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke(void *a1)
{
  uint64_t v2 = MEMORY[0x223CAC810](*(void *)(a1[4] + 8));
  v3 = (void (**)(void, void, void, void))v2;
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = (void *)a1[7];
  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2;
    v7[3] = &unk_264684460;
    id v8 = v6;
    ((void (**)(void, uint64_t, uint64_t, void *))v3)[2](v3, v4, v5, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, a1[5], a1[6], 0);
  }
}

uint64_t __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  if (a2)
  {
    uint64_t v5 = blt_general_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2_cold_1(v5);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

void __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2(void *a1)
{
  uint64_t v2 = MEMORY[0x223CAC810](*(void *)(a1[4] + 8));
  v3 = (void (**)(void, void, void, void))v2;
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = (void *)a1[7];
  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2_3;
    v7[3] = &unk_264683CA0;
    id v8 = v6;
    ((void (**)(void, uint64_t, uint64_t, void *))v3)[2](v3, v4, v5, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, a1[5], a1[6], 0);
  }
}

uint64_t __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_3(void *a1)
{
  id v2 = (id)MEMORY[0x223CAC810](*(void *)(a1[4] + 8));
  (*((void (**)(id, void, void))v2 + 2))(v2, a1[5], a1[6]);
}

- (void)pingWithBulletin:(id)a3 ack:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__BLTPingHandlerHolder_pingWithBulletin_ack___block_invoke;
  block[3] = &unk_264683E50;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __45__BLTPingHandlerHolder_pingWithBulletin_ack___block_invoke(void *a1)
{
  id v2 = (unsigned char *)a1[4];
  if (v2[17])
  {
    uint64_t v3 = [MEMORY[0x263F1DF08] notificationForBulletin:a1[5]];
    id v2 = (unsigned char *)a1[4];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  [v2 pingWithBulletin:a1[5] notification:v3 ack:a1[6]];
}

- (void)pingWithBulletin:(id)a3 notification:(id)a4 ack:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke;
  v21[3] = &unk_264684488;
  v21[4] = self;
  id v22 = v9;
  id v24 = v10;
  id v23 = v8;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_4;
  v17[3] = &unk_264684488;
  v17[4] = self;
  id v18 = v22;
  id v20 = v24;
  id v19 = v23;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_4;
  v14[3] = &unk_264683E78;
  v14[4] = self;
  id v15 = v18;
  id v16 = v19;
  id v11 = v19;
  id v12 = v18;
  id v13 = v24;
  [(BLTPingHandlerHolder *)self _performPingWithAckableForwardBlock:v21 ackableNoParametersBlock:v17 noAckBlock:v14 clientAck:v13];
}

void __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  int v3 = *(unsigned __int8 *)(v2 + 17);
  uint64_t v4 = MEMORY[0x223CAC810](*(void *)(v2 + 8));
  uint64_t v5 = (void *)a1[7];
  id v7 = (id)v4;
  if (v3)
  {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, a1[5], v5);
  }
  else
  {
    uint64_t v6 = a1[6];
    if (v5)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_2;
      v8[3] = &unk_264684460;
      id v9 = v5;
      (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, v6, v8);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v6);
    }
  }
}

uint64_t __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  if (a2)
  {
    uint64_t v5 = blt_general_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2_cold_1(v5);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

void __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[4];
  int v3 = *(unsigned __int8 *)(v2 + 17);
  uint64_t v4 = MEMORY[0x223CAC810](*(void *)(v2 + 8));
  uint64_t v5 = (void (**)(void, void, void))v4;
  uint64_t v6 = (void *)a1[7];
  if (!v3)
  {
    uint64_t v7 = a1[6];
    if (v6)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_3;
      v9[3] = &unk_264683CA0;
      id v10 = v6;
      ((void (**)(void, uint64_t, void *))v5)[2](v5, v7, v9);
      id v8 = v10;
      goto LABEL_6;
    }
LABEL_7:
    (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, v7, 0);
    goto LABEL_8;
  }
  uint64_t v7 = a1[5];
  if (!v6) {
    goto LABEL_7;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_2_5;
  v11[3] = &unk_264683CA0;
  id v12 = v6;
  ((void (**)(void, uint64_t, void *))v5)[2](v5, v7, v11);
  id v8 = v12;
LABEL_6:

LABEL_8:
}

uint64_t __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_2_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__BLTPingHandlerHolder_pingWithBulletin_notification_ack___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 17);
  uint64_t v4 = MEMORY[0x223CAC810](*(void *)(v2 + 8));
  id v6 = (id)v4;
  uint64_t v5 = 40;
  if (!v3) {
    uint64_t v5 = 48;
  }
  (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + v5));
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (BOOL)forBulletin
{
  return self->_forBulletin;
}

- (BOOL)forNotification
{
  return self->_forNotification;
}

- (unint64_t)ackType
{
  return self->_ackType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong(&self->_pingHandler, 0);
}

void __58__BLTPingHandlerHolder_pingWithRecordID_forSectionID_ack___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Unknown ack forward value", v1, 2u);
}

@end