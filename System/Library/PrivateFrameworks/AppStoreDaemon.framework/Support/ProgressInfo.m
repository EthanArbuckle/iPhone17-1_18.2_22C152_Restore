@interface ProgressInfo
- (id)description;
@end

@implementation ProgressInfo

- (id)description
{
  if ([(ASDProgress *)self->_asdProgress phase] == (id)2)
  {
    v20.receiver = self;
    v20.super_class = (Class)ProgressInfo;
    v3 = [(ProgressInfo *)&v20 description];
    bundleID = self->_bundleID;
    double progressPercentage = self->_progressPercentage;
    [(ASDProgress *)self->_asdProgress throughput];
    uint64_t v7 = v6;
    id v8 = [(ASDProgress *)self->_asdProgress secondsRemaining];
    unint64_t v9 = (unint64_t)[(ASDProgress *)self->_asdProgress phase];
    if (v9 > 7) {
      CFStringRef v10 = &stru_10052E4D8;
    }
    else {
      CFStringRef v10 = off_10052D868[v9];
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: {bundleID = %@; fractionCompleted = %.3f; throughput = %.0f; remaining = %ld phase = %@}",
      v3,
      bundleID,
      *(void *)&progressPercentage,
      v7,
      v8,
      v10);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)ProgressInfo;
    v3 = [(ProgressInfo *)&v19 description];
    v11 = self->_bundleID;
    double v12 = self->_progressPercentage;
    unint64_t v13 = (unint64_t)[(ASDProgress *)self->_asdProgress phase];
    if (v13 > 7) {
      CFStringRef v14 = &stru_10052E4D8;
    }
    else {
      CFStringRef v14 = off_10052D868[v13];
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: {bundleID = %@; fractionCompleted = %.3f; phase = %@}",
      v3,
      v11,
      *(void *)&v12,
      v14,
      v17,
      v18);
  v15 = };

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeItemID, 0);
  objc_storeStrong((id *)&self->_progressPortions, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_asdProgress, 0);
  objc_storeStrong((id *)&self->_smoothingSamples, 0);
  objc_storeStrong((id *)&self->_samples, 0);
}

@end