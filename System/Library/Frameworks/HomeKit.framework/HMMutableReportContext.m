@interface HMMutableReportContext
+ (id)reportContextWithDomain:(id)a3 requestInfo:(id)a4;
+ (id)reportContextWithDomain:(id)a3 requestInfo:(id)a4 timeout:(double)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation HMMutableReportContext

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[HMMutableReportContext allocWithZone:a3];
  v5 = [(HMReportContext *)self reportDomain];
  v6 = [(HMReportContext *)self requestInfo];
  [(HMReportContext *)self reportTimeout];
  v7 = -[HMReportContext initWithReportDomain:requestInfo:timeout:](v4, "initWithReportDomain:requestInfo:timeout:", v5, v6);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMReportContext allocWithZone:a3];
  v5 = [(HMReportContext *)self reportDomain];
  v6 = [(HMReportContext *)self requestInfo];
  [(HMReportContext *)self reportTimeout];
  v7 = -[HMReportContext initWithReportDomain:requestInfo:timeout:](v4, "initWithReportDomain:requestInfo:timeout:", v5, v6);

  return v7;
}

+ (id)reportContextWithDomain:(id)a3 requestInfo:(id)a4
{
  return +[HMMutableReportContext reportContextWithDomain:a3 requestInfo:a4 timeout:0.0];
}

+ (id)reportContextWithDomain:(id)a3 requestInfo:(id)a4 timeout:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(HMReportContext *)[HMMutableReportContext alloc] initWithReportDomain:v8 requestInfo:v7 timeout:a5];

  return v9;
}

@end