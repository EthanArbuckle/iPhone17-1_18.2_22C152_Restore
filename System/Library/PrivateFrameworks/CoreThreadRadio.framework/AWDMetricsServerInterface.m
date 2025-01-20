@interface AWDMetricsServerInterface
- (AWDMetricsServerInterface)init;
- (AWDServerConnection)awdServerConnection;
- (BOOL)setupAWDMetricsServerConnections;
- (OS_dispatch_queue)msgQueue;
- (void)handleMetricQuery:(unsigned int)a3;
- (void)init;
- (void)setAwdServerConnection:(id)a3;
- (void)setMsgQueue:(id)a3;
- (void)setupAWDMetricsServerConnections;
@end

@implementation AWDMetricsServerInterface

- (AWDMetricsServerInterface)init
{
  v14.receiver = self;
  v14.super_class = (Class)AWDMetricsServerInterface;
  v2 = [(AWDMetricsServerInterface *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Flagstone.analytics.awd.queue", v3);
    msgQueue = v2->_msgQueue;
    v2->_msgQueue = (OS_dispatch_queue *)v4;

    if (v2->_msgQueue)
    {
      v6 = log_get_logging_obg("com.apple.wpantund.awd", "default");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : init - Message Queue setup", v13, 2u);
      }

      v7 = (AWDServerConnection *)[objc_alloc((Class)AWDServerConnection) initWithComponentId:137 andBlockOnConfiguration:1];
      awdServerConnection = v2->_awdServerConnection;
      v2->_awdServerConnection = v7;

      if (v2->_awdServerConnection)
      {
        v9 = log_get_logging_obg("com.apple.wpantund.awd", "default");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : init - AWD Server Connection setup", v13, 2u);
        }

        [(AWDMetricsServerInterface *)v2 setupAWDMetricsServerConnections];
        goto LABEL_9;
      }
      v11 = log_get_logging_obg("com.apple.wpantund.awd", "default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[AWDMetricsServerInterface init]();
      }
    }
    else
    {
      v11 = log_get_logging_obg("com.apple.wpantund.awd", "default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[AWDMetricsServerInterface init]();
      }
    }

    v10 = 0;
    goto LABEL_15;
  }
LABEL_9:
  v10 = v2;
LABEL_15:

  return v10;
}

- (BOOL)setupAWDMetricsServerConnections
{
  awdServerConnection = self->_awdServerConnection;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke;
  v26[3] = &unk_100495920;
  v26[4] = self;
  if ([(AWDServerConnection *)awdServerConnection registerQueriableMetric:8978433 callback:v26])
  {
    dispatch_queue_t v4 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_EngagementMetrics", buf, 2u);
    }
  }
  else
  {
    dispatch_queue_t v4 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AWDMetricsServerInterface setupAWDMetricsServerConnections].cold.7();
    }
  }

  v5 = self->_awdServerConnection;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_7;
  v24[3] = &unk_100495920;
  v24[4] = self;
  if ([(AWDServerConnection *)v5 registerQueriableMetric:8978434 callback:v24])
  {
    v6 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_NetworkRadioMetrics", buf, 2u);
    }
  }
  else
  {
    v6 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AWDMetricsServerInterface setupAWDMetricsServerConnections].cold.6();
    }
  }

  v7 = self->_awdServerConnection;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_9;
  v23[3] = &unk_100495920;
  v23[4] = self;
  if ([(AWDServerConnection *)v7 registerQueriableMetric:8978435 callback:v23])
  {
    v8 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_MACMetrics", buf, 2u);
    }
  }
  else
  {
    v8 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AWDMetricsServerInterface setupAWDMetricsServerConnections].cold.5();
    }
  }

  v9 = self->_awdServerConnection;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_11;
  v22[3] = &unk_100495920;
  v22[4] = self;
  if ([(AWDServerConnection *)v9 registerQueriableMetric:8978436 callback:v22])
  {
    v10 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_CoexMetrics", buf, 2u);
    }
  }
  else
  {
    v10 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AWDMetricsServerInterface setupAWDMetricsServerConnections].cold.4();
    }
  }

  v11 = self->_awdServerConnection;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_13;
  v21[3] = &unk_100495920;
  v21[4] = self;
  if ([(AWDServerConnection *)v11 registerQueriableMetric:8978437 callback:v21])
  {
    v12 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_IPMLEMetrics", buf, 2u);
    }
  }
  else
  {
    v12 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AWDMetricsServerInterface setupAWDMetricsServerConnections]();
    }
  }

  v13 = self->_awdServerConnection;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_15;
  v20[3] = &unk_100495920;
  v20[4] = self;
  if ([(AWDServerConnection *)v13 registerQueriableMetric:8978439 callback:v20])
  {
    objc_super v14 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_PowerMetrics", buf, 2u);
    }
  }
  else
  {
    objc_super v14 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AWDMetricsServerInterface setupAWDMetricsServerConnections]();
    }
  }

  v15 = self->_awdServerConnection;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_17;
  v19[3] = &unk_100495920;
  v19[4] = self;
  unsigned __int8 v16 = [(AWDServerConnection *)v15 registerQueriableMetric:8978440 callback:v19];
  if (v16)
  {
    v17 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : registered callback for AWDMetricId_Flagstone_TopologyMetrics", buf, 2u);
    }
  }
  else
  {
    v17 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[AWDMetricsServerInterface setupAWDMetricsServerConnections]();
    }
  }

  return v16;
}

void __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke(uint64_t a1, int a2)
{
  dispatch_queue_t v4 = log_get_logging_obg("com.apple.wpantund.awd", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : setupAWDMetricsServerConnections - incoming metricId = %d", buf, 8u);
  }

  v5 = [*(id *)(a1 + 32) msgQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_4;
  v6[3] = &unk_1004958F8;
  v6[4] = *(void *)(a1 + 32);
  int v7 = a2;
  dispatch_async(v5, v6);
}

id __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMetricQuery:*(unsigned int *)(a1 + 40)];
}

void __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_7(uint64_t a1, int a2)
{
  dispatch_queue_t v4 = log_get_logging_obg("com.apple.wpantund.awd", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : setupAWDMetricsServerConnections - incoming metricId = %d", buf, 8u);
  }

  v5 = [*(id *)(a1 + 32) msgQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_8;
  v6[3] = &unk_1004958F8;
  v6[4] = *(void *)(a1 + 32);
  int v7 = a2;
  dispatch_async(v5, v6);
}

id __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMetricQuery:*(unsigned int *)(a1 + 40)];
}

void __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_9(uint64_t a1, int a2)
{
  dispatch_queue_t v4 = log_get_logging_obg("com.apple.wpantund.awd", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : setupAWDMetricsServerConnections - incoming metricId = %d", buf, 8u);
  }

  v5 = [*(id *)(a1 + 32) msgQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_10;
  v6[3] = &unk_1004958F8;
  v6[4] = *(void *)(a1 + 32);
  int v7 = a2;
  dispatch_async(v5, v6);
}

id __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMetricQuery:*(unsigned int *)(a1 + 40)];
}

void __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_11(uint64_t a1, int a2)
{
  dispatch_queue_t v4 = log_get_logging_obg("com.apple.wpantund.awd", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : setupAWDMetricsServerConnections - incoming metricId = %d", buf, 8u);
  }

  v5 = [*(id *)(a1 + 32) msgQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_12;
  v6[3] = &unk_1004958F8;
  v6[4] = *(void *)(a1 + 32);
  int v7 = a2;
  dispatch_async(v5, v6);
}

id __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMetricQuery:*(unsigned int *)(a1 + 40)];
}

void __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_13(uint64_t a1, int a2)
{
  dispatch_queue_t v4 = log_get_logging_obg("com.apple.wpantund.awd", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : setupAWDMetricsServerConnections - incoming metricId = %d", buf, 8u);
  }

  v5 = [*(id *)(a1 + 32) msgQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_14;
  v6[3] = &unk_1004958F8;
  v6[4] = *(void *)(a1 + 32);
  int v7 = a2;
  dispatch_async(v5, v6);
}

id __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMetricQuery:*(unsigned int *)(a1 + 40)];
}

void __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_15(uint64_t a1, int a2)
{
  dispatch_queue_t v4 = log_get_logging_obg("com.apple.wpantund.awd", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : setupAWDMetricsServerConnections - incoming metricId = %d", buf, 8u);
  }

  v5 = [*(id *)(a1 + 32) msgQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_16;
  v6[3] = &unk_1004958F8;
  v6[4] = *(void *)(a1 + 32);
  int v7 = a2;
  dispatch_async(v5, v6);
}

id __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMetricQuery:*(unsigned int *)(a1 + 40)];
}

void __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_17(uint64_t a1, int a2)
{
  dispatch_queue_t v4 = log_get_logging_obg("com.apple.wpantund.awd", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : setupAWDMetricsServerConnections - incoming metricId = %d", buf, 8u);
  }

  v5 = [*(id *)(a1 + 32) msgQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_18;
  v6[3] = &unk_1004958F8;
  v6[4] = *(void *)(a1 + 32);
  int v7 = a2;
  dispatch_async(v5, v6);
}

id __61__AWDMetricsServerInterface_setupAWDMetricsServerConnections__block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMetricQuery:*(unsigned int *)(a1 + 40)];
}

- (void)handleMetricQuery:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 8978440 && (AWDMetricsClient_IsModified_Topology() & 1) == 0)
  {
    v6 = log_get_logging_obg("com.apple.wpantund.awd", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v36[0] = 67109120;
      v36[1] = 8978440;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AWDMetricsServerInterface : handleMetricQuery with metricId %d return here as topology not modified", (uint8_t *)v36, 8u);
    }
  }
  else
  {
    v5 = [(AWDMetricsServerInterface *)self awdServerConnection];
    v6 = [v5 newMetricContainerWithIdentifier:v3];

    if (v6)
    {
      int v7 = 0;
      switch((int)v3)
      {
        case 8978433:
        case 8978434:
        case 8978435:
        case 8978436:
        case 8978437:
        case 8978439:
          int v7 = objc_opt_new();
          break;
        case 8978440:
          int v7 = objc_opt_new();
          goto LABEL_11;
        default:
LABEL_11:
          objc_super v14 = log_get_logging_obg("com.apple.wpantund.awd", "default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[AWDMetricsServerInterface handleMetricQuery:](v3, v14, v15, v16, v17, v18, v19, v20);
          }

          break;
      }
      if (v7)
      {
        switch((int)v3)
        {
          case 8978433:
            AWDMetricsClient_GetMetrics_Engagement(v7);
            AWDMetricsClient_ResetMetrics_Engagement();
            [v6 setMetric:v7];
            v21 = [(AWDMetricsServerInterface *)self awdServerConnection];
            unsigned __int8 v22 = [v21 submitMetric:v6];

            if (g_is_loggingEnabled) {
              AWDMetricsLogger_EngagementMetrics(v7);
            }
            goto LABEL_31;
          case 8978434:
            AWDMetricsClient_GetMetrics_NetworkRadio(v7);
            AWDMetricsClient_ResetMetrics_NetworkRadio();
            [v6 setMetric:v7];
            v26 = [(AWDMetricsServerInterface *)self awdServerConnection];
            unsigned __int8 v22 = [v26 submitMetric:v6];

            if (g_is_loggingEnabled) {
              AWDMetricsLogger_NetworkRadioMetrics(v7);
            }
            goto LABEL_31;
          case 8978435:
            AWDMetricsClient_GetMetrics_MAC(v7);
            AWDMetricsClient_ResetMetrics_MAC();
            [v6 setMetric:v7];
            v23 = [(AWDMetricsServerInterface *)self awdServerConnection];
            unsigned __int8 v22 = [v23 submitMetric:v6];

            if (g_is_loggingEnabled) {
              AWDMetricsLogger_MACMetrics(v7);
            }
            goto LABEL_31;
          case 8978436:
            AWDMetricsClient_GetMetrics_Coex(v7);
            AWDMetricsClient_ResetMetrics_Coex();
            [v6 setMetric:v7];
            v27 = [(AWDMetricsServerInterface *)self awdServerConnection];
            unsigned __int8 v22 = [v27 submitMetric:v6];

            if (g_is_loggingEnabled) {
              AWDMetricsLogger_CoexMetrics(v7);
            }
            goto LABEL_31;
          case 8978437:
            AWDMetricsClient_GetMetrics_IPMLE(v7);
            AWDMetricsClient_ResetMetrics_IPMLE();
            [v6 setMetric:v7];
            v28 = [(AWDMetricsServerInterface *)self awdServerConnection];
            unsigned __int8 v22 = [v28 submitMetric:v6];

            if (g_is_loggingEnabled) {
              AWDMetricsLogger_IPMLEMetrics(v7);
            }
            goto LABEL_31;
          case 8978439:
            AWDMetricsClient_GetMetrics_Power(v7);
            AWDMetricsClient_ResetMetrics_Power();
            [v6 setMetric:v7];
            v25 = [(AWDMetricsServerInterface *)self awdServerConnection];
            unsigned __int8 v22 = [v25 submitMetric:v6];

            if (g_is_loggingEnabled) {
              AWDMetricsLogger_PowerMetrics(v7);
            }
            goto LABEL_31;
          default:
            if (v3 != 8978440) {
              break;
            }
            AWDMetricsClient_GetMetrics_Topology(v7);
            AWDMetricsClient_ResetMetrics_Topology();
            [v6 setMetric:v7];
            v24 = [(AWDMetricsServerInterface *)self awdServerConnection];
            unsigned __int8 v22 = [v24 submitMetric:v6];

            if (g_is_loggingEnabled) {
              AWDMetricsLogger_TopologyMetrics(v7);
            }
LABEL_31:
            if ((v22 & 1) == 0)
            {
              v29 = log_get_logging_obg("com.apple.wpantund.awd", "default");
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                -[AWDMetricsServerInterface handleMetricQuery:](v3, v29, v30, v31, v32, v33, v34, v35);
              }
            }
            break;
        }
      }
    }
    else
    {
      int v7 = log_get_logging_obg("com.apple.wpantund.awd", "default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[AWDMetricsServerInterface handleMetricQuery:](v3, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
}

- (OS_dispatch_queue)msgQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMsgQueue:(id)a3
{
}

- (AWDServerConnection)awdServerConnection
{
  return (AWDServerConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAwdServerConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdServerConnection, 0);

  objc_storeStrong((id *)&self->_msgQueue, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetricsServerInterface : init - error during create AWD Server Connection", v2, v3, v4, v5, v6);
}

- (void)setupAWDMetricsServerConnections
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "AWDMetricsServerInterface : error during register callback for AWDMetricId_Flagstone_EngagementMetrics", v2, v3, v4, v5, v6);
}

- (void)handleMetricQuery:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleMetricQuery:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleMetricQuery:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end