@interface MIRelocatedBundleContainer
- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6;
- (BOOL)makeContainerLiveWithError:(id *)a3;
- (BOOL)purgeContentWithError:(id *)a3;
- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3;
- (BOOL)shouldHaveCorrespondingDataContainer;
- (unint64_t)diskUsage;
@end

@implementation MIRelocatedBundleContainer

- (BOOL)makeContainerLiveWithError:(id *)a3
{
  v5 = _CreateAndLogError((uint64_t)"-[MIRelocatedBundleContainer makeContainerLiveWithError:]", 24, @"MIInstallerErrorDomain", 4, 0, 0, @"There is nothing to be made live", v3, v8);
  v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return 0;
}

- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6
{
  uint64_t v8 = _CreateAndLogError((uint64_t)"-[MIRelocatedBundleContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 33, @"MIInstallerErrorDomain", 4, 0, 0, @"There is nothing to be replaced", v6, v11);
  v9 = v8;
  if (a6) {
    *a6 = v8;
  }

  return 0;
}

- (BOOL)purgeContentWithError:(id *)a3
{
  v5 = _CreateAndLogError((uint64_t)"-[MIRelocatedBundleContainer purgeContentWithError:]", 42, @"MIInstallerErrorDomain", 4, 0, 0, @"There is nothing to purge", v3, v8);
  uint64_t v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return 0;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  v5 = _CreateAndLogError((uint64_t)"-[MIRelocatedBundleContainer regenerateDirectoryUUIDWithError:]", 51, @"MIInstallerErrorDomain", 4, 0, 0, @"There is nothing to generate UUID", v3, v8);
  uint64_t v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return 0;
}

- (unint64_t)diskUsage
{
  uint64_t v3 = +[MIFileManager defaultManager];
  v4 = [(MIContainer *)self containerURL];
  unint64_t v5 = [v3 diskUsageForURL:v4];

  return v5;
}

- (BOOL)shouldHaveCorrespondingDataContainer
{
  return 0;
}

@end