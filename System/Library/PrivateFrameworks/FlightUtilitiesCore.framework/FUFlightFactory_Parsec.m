@interface FUFlightFactory_Parsec
+ (void)loadFlightStructuresWithFlightNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 userAgent:(id)a7 sessionID:(id)a8 completionHandler:(id)a9;
+ (void)loadFlightsWithNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 userAgent:(id)a7 sessionID:(id)a8 completionHandler:(id)a9;
@end

@implementation FUFlightFactory_Parsec

+ (void)loadFlightsWithNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 userAgent:(id)a7 sessionID:(id)a8 completionHandler:(id)a9
{
  id v15 = a4;
  id v16 = a9;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __112__FUFlightFactory_Parsec_loadFlightsWithNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke;
  v19[3] = &unk_264545E30;
  id v21 = v16;
  unint64_t v22 = a3;
  id v20 = v15;
  id v17 = v15;
  id v18 = v16;
  [a1 loadFlightStructuresWithFlightNumber:a3 airlineCode:v17 date:a5 dateType:a6 userAgent:a7 sessionID:a8 completionHandler:v19];
}

+ (void)loadFlightStructuresWithFlightNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 userAgent:(id)a7 sessionID:(id)a8 completionHandler:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = dispatch_get_global_queue(0, 0);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __127__FUFlightFactory_Parsec_loadFlightStructuresWithFlightNumber_airlineCode_date_dateType_userAgent_sessionID_completionHandler___block_invoke;
  v26[3] = &unk_264545E80;
  id v31 = v19;
  unint64_t v32 = a3;
  id v27 = v15;
  id v28 = v16;
  int64_t v33 = a6;
  id v34 = a1;
  id v29 = v17;
  id v30 = v18;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v19;
  id v25 = v15;
  dispatch_async(v20, v26);
}

@end