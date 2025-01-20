@interface AMDService
+ (id)sendReplyForBatchPEC:(id)a3 requestError:(id)a4 uuid:(id)a5 error:(id *)a6;
+ (id)sendReplyForBatchPIR:(id)a3 requestError:(id)a4 keywords:(id)a5 uuid:(id)a6 error:(id *)a7;
+ (id)sendReplyForPIRData:(id)a3 requestError:(id)a4 keyword:(id)a5 uuid:(id)a6 error:(id *)a7;
@end

@implementation AMDService

+ (id)sendReplyForPIRData:(id)a3 requestError:(id)a4 keyword:(id)a5 uuid:(id)a6 error:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  getAMDClientClass();
  v15 = objc_opt_new();
  v16 = [v15 sendPIRData:v14 forKeyword:v12 withCallHandle:v11 andRequestError:v13 error:a7];

  return v16;
}

+ (id)sendReplyForBatchPIR:(id)a3 requestError:(id)a4 keywords:(id)a5 uuid:(id)a6 error:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  getAMDClientClass();
  v15 = objc_opt_new();
  v16 = [v15 sendBatchedPIRData:v14 forKeywords:v12 withCallHandle:v11 andRequestError:v13 error:a7];

  return v16;
}

+ (id)sendReplyForBatchPEC:(id)a3 requestError:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  getAMDClientClass();
  id v12 = objc_opt_new();
  id v13 = [v12 sendBatchedPECSimilarityScores:v11 withCallHandle:v9 andRequestError:v10 error:a6];

  return v13;
}

@end