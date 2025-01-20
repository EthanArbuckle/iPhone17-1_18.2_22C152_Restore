@interface CMCaptureFrameSenderEndpointsServerSideSingleton
+ (BOOL)addEndpoint:(id)a3 endpointUniqueID:(id)a4 endpointType:(id)a5 endpointPID:(int)a6 endpointProxyPID:(int)a7 endpointAuditToken:(id)a8 endpointProxyAuditToken:(id)a9 endpointCameraUniqueID:(id)a10;
+ (BOOL)removeAllEndpointsWithPID:(int)a3;
+ (BOOL)removeEndpointWithUniqueID:(id)a3;
+ (NSDictionary)endpointsByPID;
+ (id)createXPCArrayOfFrameSenderEndpoints;
@end

@implementation CMCaptureFrameSenderEndpointsServerSideSingleton

+ (BOOL)addEndpoint:(id)a3 endpointUniqueID:(id)a4 endpointType:(id)a5 endpointPID:(int)a6 endpointProxyPID:(int)a7 endpointAuditToken:(id)a8 endpointProxyAuditToken:(id)a9 endpointCameraUniqueID:(id)a10
{
  uint64_t v11 = *(void *)&a7;
  uint64_t v12 = *(void *)&a6;
  os_unfair_lock_lock(&sServerSideEndpointsLock);
  if (cfs_serverSideEndpoints_initServerSiderEndpoints != -1) {
    dispatch_once(&cfs_serverSideEndpoints_initServerSiderEndpoints, &__block_literal_global_185);
  }
  v16 = @"unknown";
  if (a10) {
    v16 = (__CFString *)a10;
  }
  char v17 = [(id)sServerSideEndpoints addEndpoint:a3 endpointUniqueID:a4 endpointType:a5 endpointPID:v12 endpointProxyPID:v11 endpointAuditToken:a8 endpointProxyAuditToken:a9 endpointCameraUniqueID:v16];
  os_unfair_lock_unlock(&sServerSideEndpointsLock);
  return v17;
}

+ (NSDictionary)endpointsByPID
{
  os_unfair_lock_lock(&sServerSideEndpointsLock);
  if (cfs_serverSideEndpoints_initServerSiderEndpoints != -1) {
    dispatch_once(&cfs_serverSideEndpoints_initServerSiderEndpoints, &__block_literal_global_185);
  }
  v2 = (NSDictionary *)[(id)sServerSideEndpoints endpointsByPID];
  os_unfair_lock_unlock(&sServerSideEndpointsLock);
  return v2;
}

+ (BOOL)removeAllEndpointsWithPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  os_unfair_lock_lock(&sServerSideEndpointsLock);
  if (cfs_serverSideEndpoints_initServerSiderEndpoints != -1) {
    dispatch_once(&cfs_serverSideEndpoints_initServerSiderEndpoints, &__block_literal_global_185);
  }
  char v4 = [(id)sServerSideEndpoints removeAllEndpointsWithPID:v3];
  os_unfair_lock_unlock(&sServerSideEndpointsLock);
  return v4;
}

+ (BOOL)removeEndpointWithUniqueID:(id)a3
{
  os_unfair_lock_lock(&sServerSideEndpointsLock);
  if (cfs_serverSideEndpoints_initServerSiderEndpoints != -1) {
    dispatch_once(&cfs_serverSideEndpoints_initServerSiderEndpoints, &__block_literal_global_185);
  }
  char v4 = [(id)sServerSideEndpoints removeEndpointWithUniqueID:a3];
  os_unfair_lock_unlock(&sServerSideEndpointsLock);
  return v4;
}

+ (id)createXPCArrayOfFrameSenderEndpoints
{
  os_unfair_lock_lock(&sServerSideEndpointsLock);
  if (cfs_serverSideEndpoints_initServerSiderEndpoints != -1) {
    dispatch_once(&cfs_serverSideEndpoints_initServerSiderEndpoints, &__block_literal_global_185);
  }
  v2 = (void *)[(id)sServerSideEndpoints createXPCArrayOfFrameSenderEndpoints];
  os_unfair_lock_unlock(&sServerSideEndpointsLock);
  return v2;
}

@end