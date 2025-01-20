@interface CAFPairedDeviceList
+ (CAFPairedDeviceList)pairedDeviceListWithArray:(id)a3;
+ (CAFPairedDeviceList)pairedDeviceListWithPairedDevices:(id)a3;
- (CAFPairedDeviceList)initWithArray:(id)a3;
- (CAFPairedDeviceList)initWithPairedDevices:(id)a3;
- (NSArray)pairedDevices;
- (NSError)parseError;
- (NSString)formattedValue;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation CAFPairedDeviceList

+ (CAFPairedDeviceList)pairedDeviceListWithArray:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithArray:v4];

  return (CAFPairedDeviceList *)v5;
}

+ (CAFPairedDeviceList)pairedDeviceListWithPairedDevices:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPairedDevices:v4];

  return (CAFPairedDeviceList *)v5;
}

- (CAFPairedDeviceList)initWithPairedDevices:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAFPairedDeviceList;
  v6 = [(CAFPairedDeviceList *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pairedDevices, a3);
  }

  return v7;
}

- (CAFPairedDeviceList)initWithArray:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAFPairedDeviceList;
  id v5 = [(CAFPairedDeviceList *)&v18 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF980] array];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __37__CAFPairedDeviceList_initWithArray___block_invoke;
    v15 = &unk_265263318;
    id v16 = v6;
    v7 = v5;
    v17 = v7;
    id v8 = v6;
    [v4 enumerateObjectsUsingBlock:&v12];
    uint64_t v9 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
    pairedDevices = v7->_pairedDevices;
    v7->_pairedDevices = (NSArray *)v9;
  }
  return v5;
}

void __37__CAFPairedDeviceList_initWithArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[CAFPairedDevice alloc] initWithDictionary:v3];
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "CAF_elementParseFailedForDataSupportType:", @"PairedDeviceList");
    uint64_t v7 = *(void *)(a1 + 40);
    v6 = (uint64_t *)(a1 + 40);
    id v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v5;

    CAFGeneralLogging();
    id v4 = (CAFPairedDevice *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR)) {
      __37__CAFPairedDeviceList_initWithArray___block_invoke_cold_1(v6, (uint64_t)v3, &v4->super);
    }
  }
}

- (NSString)formattedValue
{
  id v3 = [(CAFPairedDeviceList *)self pairedDevices];
  if ([v3 count])
  {
    id v4 = NSString;
    uint64_t v5 = [(CAFPairedDeviceList *)self pairedDevices];
    v6 = [v5 componentsJoinedByString:@", "];
    uint64_t v7 = [v4 stringWithFormat:@"[ %@ ]", v6];
  }
  else
  {
    uint64_t v7 = @"(null)";
  }

  return (NSString *)v7;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v4 = [(CAFPairedDeviceList *)self pairedDevices];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = [(CAFPairedDeviceList *)self pairedDevices];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (NSArray)pairedDevices
{
  return self->_pairedDevices;
}

- (NSError)parseError
{
  return self->_parseError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseError, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
}

void __37__CAFPairedDeviceList_initWithArray___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "%{public}@: Error parsing dictionary from PairedDeviceList array - %{public}@", (uint8_t *)&v4, 0x16u);
}

@end