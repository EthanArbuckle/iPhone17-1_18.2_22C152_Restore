@interface ACCMemUsageStatInfo
- (ACCMemUsageStatInfo)init;
- (ACCMemUsageStatInfo)initWithName:(id)a3;
- (ACCMemUsageStatInfo)initWithName:(id)a3 andInfo:(id)a4;
- (ACCStatInfoAccumulator)physFootprintMem;
- (ACCStatInfoAccumulator)residentMem;
- (ACCStatInfoAccumulator)virtualMem;
- (NSDate)lastUpdateTime;
- (NSDate)startTime;
- (NSString)name;
- (double)timeIntervalSinceLastUpdate;
- (double)timeIntervalSinceStart;
- (id)description;
- (void)setInfo:(id)a3;
- (void)updateResident:(unint64_t)a3 virtualValue:(unint64_t)a4 physFootprintValue:(unint64_t)a5;
@end

@implementation ACCMemUsageStatInfo

- (ACCMemUsageStatInfo)init
{
  v15.receiver = self;
  v15.super_class = (Class)ACCMemUsageStatInfo;
  v2 = [(ACCMemUsageStatInfo *)&v15 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

    v5 = [[ACCStatInfoAccumulator alloc] initWithName:@"resident"];
    residentMem = v3->_residentMem;
    v3->_residentMem = v5;

    v7 = [[ACCStatInfoAccumulator alloc] initWithName:@"virtual"];
    virtualMem = v3->_virtualMem;
    v3->_virtualMem = v7;

    v9 = [[ACCStatInfoAccumulator alloc] initWithName:@"physFootprint"];
    physFootprintMem = v3->_physFootprintMem;
    v3->_physFootprintMem = v9;

    uint64_t v11 = [MEMORY[0x263EFF910] date];
    startTime = v3->_startTime;
    v3->_startTime = (NSDate *)v11;

    lastUpdateTime = v3->_lastUpdateTime;
    v3->_lastUpdateTime = 0;
  }
  return v3;
}

- (ACCMemUsageStatInfo)initWithName:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ACCMemUsageStatInfo;
  v6 = [(ACCMemUsageStatInfo *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = [ACCStatInfoAccumulator alloc];
    v9 = [NSString stringWithFormat:@"%@-resident", v5];
    uint64_t v10 = [(ACCStatInfoAccumulator *)v8 initWithName:v9];
    residentMem = v7->_residentMem;
    v7->_residentMem = (ACCStatInfoAccumulator *)v10;

    v12 = [ACCStatInfoAccumulator alloc];
    v13 = [NSString stringWithFormat:@"%@-virtual", v5];
    uint64_t v14 = [(ACCStatInfoAccumulator *)v12 initWithName:v13];
    virtualMem = v7->_virtualMem;
    v7->_virtualMem = (ACCStatInfoAccumulator *)v14;

    v16 = [ACCStatInfoAccumulator alloc];
    v17 = [NSString stringWithFormat:@"%@-physFootprint", v5];
    uint64_t v18 = [(ACCStatInfoAccumulator *)v16 initWithName:v17];
    physFootprintMem = v7->_physFootprintMem;
    v7->_physFootprintMem = (ACCStatInfoAccumulator *)v18;

    uint64_t v20 = [MEMORY[0x263EFF910] date];
    startTime = v7->_startTime;
    v7->_startTime = (NSDate *)v20;

    lastUpdateTime = v7->_lastUpdateTime;
    v7->_lastUpdateTime = 0;
  }
  return v7;
}

- (ACCMemUsageStatInfo)initWithName:(id)a3 andInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ACCMemUsageStatInfo;
  v9 = [(ACCMemUsageStatInfo *)&v27 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    uint64_t v11 = [ACCStatInfoAccumulator alloc];
    v12 = [NSString stringWithFormat:@"%@-resident", v7];
    uint64_t v13 = [(ACCStatInfoAccumulator *)v11 initWithName:v12];
    residentMem = v10->_residentMem;
    v10->_residentMem = (ACCStatInfoAccumulator *)v13;

    objc_super v15 = [ACCStatInfoAccumulator alloc];
    v16 = [NSString stringWithFormat:@"%@-virtual", v7];
    uint64_t v17 = [(ACCStatInfoAccumulator *)v15 initWithName:v16];
    virtualMem = v10->_virtualMem;
    v10->_virtualMem = (ACCStatInfoAccumulator *)v17;

    v19 = [ACCStatInfoAccumulator alloc];
    uint64_t v20 = [NSString stringWithFormat:@"%@-physFootprint", v7];
    uint64_t v21 = [(ACCStatInfoAccumulator *)v19 initWithName:v20];
    physFootprintMem = v10->_physFootprintMem;
    v10->_physFootprintMem = (ACCStatInfoAccumulator *)v21;

    uint64_t v23 = [MEMORY[0x263EFF910] date];
    startTime = v10->_startTime;
    v10->_startTime = (NSDate *)v23;

    lastUpdateTime = v10->_lastUpdateTime;
    v10->_lastUpdateTime = 0;

    [(ACCMemUsageStatInfo *)v10 setInfo:v8];
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x263EFF910] date];
  name = &stru_26DA06AE8;
  if (self->_name) {
    name = (__CFString *)self->_name;
  }
  v22 = name;
  uint64_t v23 = NSString;
  [(NSDate *)self->_startTime timeIntervalSince1970];
  uint64_t v21 = v5;
  [(NSDate *)self->_lastUpdateTime timeIntervalSince1970];
  uint64_t v20 = v6;
  [v3 timeIntervalSince1970];
  uint64_t v19 = v7;
  [v3 timeIntervalSinceDate:self->_startTime];
  uint64_t v18 = v8;
  [v3 timeIntervalSinceDate:self->_lastUpdateTime];
  uint64_t v17 = v9;
  unint64_t v16 = [(ACCStatInfoAccumulator *)self->_residentMem start];
  double v15 = (double)[(ACCStatInfoAccumulator *)self->_residentMem start] / 1000000.0;
  unint64_t v14 = [(ACCStatInfoAccumulator *)self->_residentMem last];
  double v13 = (double)[(ACCStatInfoAccumulator *)self->_residentMem last] / 1000000.0;
  unint64_t v12 = [(ACCStatInfoAccumulator *)self->_residentMem max];
  objc_msgSend(v23, "stringWithFormat:", @"  ACCMemUsageStatInfo:%@ startTime=%f, lastUpdateTime=%f, curTime=%f, sinceStart=%f, sinceLast=%f \n         resident: (start:%10llu / %8.3fM, last:%10llu / %8.3fM, max:%10llu / %8.3fM, diff:%10llu / %8.3fM, avg:%10llu / %8.3fM) \n          virtual: (start:%10llu / %8.3fM, last:%10llu / %8.3fM, max:%10llu / %8.3fM, diff:%10llu / %8.3fM, avg:%10llu / %8.3fM) \n    physFootprint: (start:%10llu / %8.3fM, last:%10llu / %8.3fM, max:%10llu / %8.3fM, diff:%10llu / %8.3fM, avg:%10llu / %8.3fM) \n", v22, v21, v20, v19, v18, v17, v16, *(void *)&v15, v14, *(void *)&v13, v12, (double)-[ACCStatInfoAccumulator max](self->_residentMem, "max") / 1000000.0, -[ACCStatInfoAccumulator max](self->_residentMem, "max")- -[ACCStatInfoAccumulator start](self->_residentMem, "start"), (double)(-[ACCStatInfoAccumulator max](self->_residentMem, "max")- -[ACCStatInfoAccumulator start](self->_residentMem, "start"))
  / 1000000.0,
    [(ACCStatInfoAccumulator *)self->_residentMem average],
    (double)[(ACCStatInfoAccumulator *)self->_residentMem average] / 1000000.0,
    [(ACCStatInfoAccumulator *)self->_virtualMem start],
    (double)[(ACCStatInfoAccumulator *)self->_virtualMem start] / 1000000.0,
    [(ACCStatInfoAccumulator *)self->_virtualMem last],
    (double)[(ACCStatInfoAccumulator *)self->_virtualMem last] / 1000000.0,
    [(ACCStatInfoAccumulator *)self->_virtualMem max],
    (double)[(ACCStatInfoAccumulator *)self->_virtualMem max] / 1000000.0,
    [(ACCStatInfoAccumulator *)self->_virtualMem max]
  - [(ACCStatInfoAccumulator *)self->_virtualMem start],
    (double)([(ACCStatInfoAccumulator *)self->_virtualMem max]
           - [(ACCStatInfoAccumulator *)self->_virtualMem start])
  / 1000000.0,
    [(ACCStatInfoAccumulator *)self->_virtualMem average],
    (double)[(ACCStatInfoAccumulator *)self->_virtualMem average] / 1000000.0,
    [(ACCStatInfoAccumulator *)self->_physFootprintMem start],
    (double)[(ACCStatInfoAccumulator *)self->_physFootprintMem start] / 1000000.0,
    [(ACCStatInfoAccumulator *)self->_physFootprintMem last],
    (double)[(ACCStatInfoAccumulator *)self->_physFootprintMem last] / 1000000.0,
    [(ACCStatInfoAccumulator *)self->_physFootprintMem max],
    (double)[(ACCStatInfoAccumulator *)self->_physFootprintMem max] / 1000000.0,
    [(ACCStatInfoAccumulator *)self->_physFootprintMem max]
  - [(ACCStatInfoAccumulator *)self->_physFootprintMem start],
    (double)([(ACCStatInfoAccumulator *)self->_physFootprintMem max]
           - [(ACCStatInfoAccumulator *)self->_physFootprintMem start])
  / 1000000.0,
    [(ACCStatInfoAccumulator *)self->_physFootprintMem average],
  uint64_t v10 = (double)[(ACCStatInfoAccumulator *)self->_physFootprintMem average] / 1000000.0);

  return v10;
}

- (void)setInfo:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  uint64_t v6 = [v4 date];
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v6;

  [(ACCStatInfoAccumulator *)self->_residentMem reset];
  residentMem = self->_residentMem;
  uint64_t v9 = [v5 residentMem];
  [(ACCStatInfoAccumulator *)residentMem set:v9];

  [(ACCStatInfoAccumulator *)self->_virtualMem reset];
  virtualMem = self->_virtualMem;
  uint64_t v11 = [v5 virtualMem];
  [(ACCStatInfoAccumulator *)virtualMem set:v11];

  [(ACCStatInfoAccumulator *)self->_physFootprintMem reset];
  physFootprintMem = self->_physFootprintMem;
  id v13 = [v5 physFootprintMem];

  [(ACCStatInfoAccumulator *)physFootprintMem set:v13];
}

- (void)updateResident:(unint64_t)a3 virtualValue:(unint64_t)a4 physFootprintValue:(unint64_t)a5
{
  uint64_t v9 = [MEMORY[0x263EFF910] date];
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v9;

  [(ACCStatInfoAccumulator *)self->_residentMem add:a3];
  [(ACCStatInfoAccumulator *)self->_virtualMem add:a4];
  physFootprintMem = self->_physFootprintMem;
  [(ACCStatInfoAccumulator *)physFootprintMem add:a5];
}

- (double)timeIntervalSinceStart
{
  v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:self->_startTime];
  double v5 = v4;

  return v5;
}

- (double)timeIntervalSinceLastUpdate
{
  v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:self->_lastUpdateTime];
  double v5 = v4;

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (ACCStatInfoAccumulator)residentMem
{
  return self->_residentMem;
}

- (ACCStatInfoAccumulator)virtualMem
{
  return self->_virtualMem;
}

- (ACCStatInfoAccumulator)physFootprintMem
{
  return self->_physFootprintMem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physFootprintMem, 0);
  objc_storeStrong((id *)&self->_virtualMem, 0);
  objc_storeStrong((id *)&self->_residentMem, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end