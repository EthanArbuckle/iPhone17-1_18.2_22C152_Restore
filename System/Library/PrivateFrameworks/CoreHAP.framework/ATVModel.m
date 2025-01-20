@interface ATVModel
+ (unint64_t)atvStateFromState:(BTStatus *)a3;
+ (void)addTuple:(id)a3 ToLUT:(id)a4;
- (ATVModel)init;
- (NSDictionary)atvLUT;
- (id)findTupleForATVState:(unint64_t)a3;
- (void)setAtvLUT:(id)a3;
@end

@implementation ATVModel

- (void).cxx_destruct
{
}

- (void)setAtvLUT:(id)a3
{
}

- (NSDictionary)atvLUT
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)findTupleForATVState:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1D944E080](self, a2);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = HMFGetLogIdentifier();
    v8 = +[HAPBTLETuple atvState2String:a3];
    int v13 = 138543618;
    v14 = v7;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[ATVModel] findTupleForState state %@\n", (uint8_t *)&v13, 0x16u);
  }
  v9 = [(ATVModel *)self atvLUT];
  v10 = [NSNumber numberWithUnsignedInteger:a3];
  v11 = [v9 objectForKey:v10];

  return v11;
}

- (ATVModel)init
{
  v64[4] = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)ATVModel;
  v2 = [(ATVModel *)&v57 init];
  v3 = v2;
  if (v2)
  {
    v51 = v2;
    v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:20];
    v52 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    v5 = +[HAPBTLETuple makeTupleWithATVState:2 MaxHAPConnections:3];
    v64[0] = v5;
    v6 = +[HAPBTLETuple makeTupleWithATVState:66 MaxHAPConnections:2];
    v64[1] = v6;
    v7 = +[HAPBTLETuple makeTupleWithATVState:4 MaxHAPConnections:2];
    v64[2] = v7;
    v8 = +[HAPBTLETuple makeTupleWithATVState:68 MaxHAPConnections:1];
    v64[3] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];
    [v52 addObjectsFromArray:v9];

    v49 = +[HAPBTLETuple makeTupleWithATVState:258 MaxHAPConnections:2];
    v63[0] = v49;
    v48 = +[HAPBTLETuple makeTupleWithATVState:514 MaxHAPConnections:1];
    v63[1] = v48;
    v47 = +[HAPBTLETuple makeTupleWithATVState:1026 MaxHAPConnections:1];
    v63[2] = v47;
    v46 = +[HAPBTLETuple makeTupleWithATVState:2050 MaxHAPConnections:1];
    v63[3] = v46;
    v45 = +[HAPBTLETuple makeTupleWithATVState:322 MaxHAPConnections:1];
    v63[4] = v45;
    v10 = +[HAPBTLETuple makeTupleWithATVState:578 MaxHAPConnections:1];
    v63[5] = v10;
    v11 = +[HAPBTLETuple makeTupleWithATVState:1090 MaxHAPConnections:1];
    v63[6] = v11;
    v12 = +[HAPBTLETuple makeTupleWithATVState:386 MaxHAPConnections:1];
    v63[7] = v12;
    int v13 = +[HAPBTLETuple makeTupleWithATVState:450 MaxHAPConnections:1];
    v63[8] = v13;
    v14 = +[HAPBTLETuple makeTupleWithATVState:260 MaxHAPConnections:1];
    v63[9] = v14;
    __int16 v15 = +[HAPBTLETuple makeTupleWithATVState:516 MaxHAPConnections:1];
    v63[10] = v15;
    v16 = +[HAPBTLETuple makeTupleWithATVState:324 MaxHAPConnections:1];
    v63[11] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:12];
    [v52 addObjectsFromArray:v17];

    v50 = +[HAPBTLETuple makeTupleWithATVState:10 MaxHAPConnections:2];
    v62[0] = v50;
    v18 = +[HAPBTLETuple makeTupleWithATVState:18 MaxHAPConnections:1];
    v62[1] = v18;
    v19 = +[HAPBTLETuple makeTupleWithATVState:74 MaxHAPConnections:1];
    v62[2] = v19;
    v20 = +[HAPBTLETuple makeTupleWithATVState:82 MaxHAPConnections:1];
    v62[3] = v20;
    v21 = +[HAPBTLETuple makeTupleWithATVState:138 MaxHAPConnections:1];
    v62[4] = v21;
    v22 = +[HAPBTLETuple makeTupleWithATVState:146 MaxHAPConnections:1];
    v62[5] = v22;
    v23 = +[HAPBTLETuple makeTupleWithATVState:202 MaxHAPConnections:1];
    v62[6] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:7];
    [v52 addObjectsFromArray:v24];

    v25 = +[HAPBTLETuple makeTupleWithATVState:130 MaxHAPConnections:1];
    v61[0] = v25;
    v26 = +[HAPBTLETuple makeTupleWithATVState:194 MaxHAPConnections:1];
    v61[1] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    [v52 addObjectsFromArray:v27];

    v28 = +[HAPBTLETuple makeTupleWithATVState:4098 MaxHAPConnections:1];
    v60[0] = v28;
    v29 = +[HAPBTLETuple makeTupleWithATVState:8194 MaxHAPConnections:1];
    v60[1] = v29;
    v30 = +[HAPBTLETuple makeTupleWithATVState:16386 MaxHAPConnections:1];
    v60[2] = v30;
    v31 = +[HAPBTLETuple makeTupleWithATVState:4162 MaxHAPConnections:1];
    v60[3] = v31;
    v32 = +[HAPBTLETuple makeTupleWithATVState:8258 MaxHAPConnections:1];
    v60[4] = v32;
    v33 = +[HAPBTLETuple makeTupleWithATVState:4100 MaxHAPConnections:1];
    v60[5] = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:6];
    [v52 addObjectsFromArray:v34];

    v35 = +[HAPBTLETuple makeTupleWithATVState:1 MaxHAPConnections:5];
    v59 = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
    [v52 addObjectsFromArray:v36];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v37 = v52;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v54;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v54 != v40) {
            objc_enumerationMutation(v37);
          }
          +[ATVModel addTuple:*(void *)(*((void *)&v53 + 1) + 8 * v41++) ToLUT:v4];
        }
        while (v39 != v41);
        uint64_t v39 = [v37 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v39);
    }

    uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];
    v3 = v51;
    atvLUT = v51->_atvLUT;
    v51->_atvLUT = (NSDictionary *)v42;
  }
  return v3;
}

+ (unint64_t)atvStateFromState:(BTStatus *)a3
{
  unint64_t leRemote = a3->leRemote;
  if (a3->leRemote)
  {
    if (leRemote == 2)
    {
      unint64_t v4 = 4;
      goto LABEL_11;
    }
    if (leRemote != 1) {
      return 0;
    }
  }
  else
  {
    if (!a3->connectedDevices && a3->lowEnergyConnections == a3->hk)
    {
      unint64_t v4 = 0;
      goto LABEL_11;
    }
    a3->unint64_t leRemote = 1;
  }
  unint64_t v4 = 2;
LABEL_11:
  a2dp = a3->a2dp;
  if (a2dp)
  {
    if (a2dp != 1) {
      return 0;
    }
    v4 |= 0x80uLL;
  }
  switch(a3->btGC)
  {
    case 0uLL:
      break;
    case 1uLL:
      v4 |= 0x100uLL;
      break;
    case 2uLL:
      v4 |= 0x200uLL;
      break;
    case 3uLL:
      v4 |= 0x400uLL;
      break;
    case 4uLL:
      v4 |= 0x800uLL;
      break;
    default:
      return 0;
  }
  unint64_t btKB = a3->btKB;
  if (!btKB) {
    goto LABEL_22;
  }
  if (btKB != 1) {
    return 0;
  }
  v4 |= 0x40uLL;
LABEL_22:
  switch(a3->hk)
  {
    case 0uLL:
      break;
    case 1uLL:
      v4 |= 0x8000uLL;
      break;
    case 2uLL:
      v4 |= 0x10000uLL;
      break;
    case 3uLL:
      v4 |= 0x20000uLL;
      break;
    case 4uLL:
      v4 |= 0x40000uLL;
      break;
    case 5uLL:
      v4 |= 0x80000uLL;
      break;
    default:
      return 0;
  }
  switch(a3->leAcc)
  {
    case 0uLL:
      break;
    case 1uLL:
      v4 |= 8uLL;
      break;
    case 2uLL:
      v4 |= 0x10uLL;
      break;
    case 3uLL:
      v4 |= 0x20uLL;
      break;
    default:
      return 0;
  }
  switch(a3->eAcc)
  {
    case 0uLL:
      break;
    case 1uLL:
      v4 |= 0x1000uLL;
      break;
    case 2uLL:
      v4 |= 0x2000uLL;
      break;
    case 3uLL:
      v4 |= 0x4000uLL;
      break;
    default:
      return 0;
  }
  if (v4 <= 1) {
    return 1;
  }
  else {
    return v4;
  }
}

+ (void)addTuple:(id)a3 ToLUT:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if (v10)
  {
    if ([v10 atvState])
    {
      v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "atvState"));
      [v5 setObject:v10 forKey:v6];

      if ((int)[v10 maxHAPConnections] >= 1)
      {
        uint64_t v7 = 0;
        do
        {
          v8 = +[HAPBTLETuple makeTupleWithATVState:MaxHAPConnections:](HAPBTLETuple, "makeTupleWithATVState:MaxHAPConnections:", hkConfig_21196[v7] | [v10 atvState], objc_msgSend(v10, "maxHAPConnections"));
          v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "atvState"));
          [v5 setObject:v8 forKey:v9];

          ++v7;
        }
        while (v7 < (int)[v10 maxHAPConnections]);
      }
    }
  }
}

@end